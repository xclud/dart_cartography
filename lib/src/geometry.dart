import 'dart:math';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:vt/vt.dart' as vt;

/// Base geometry.
abstract class Geometry {
  /// Creates a Point geometry.
  factory Geometry.point({required Offset coordinates}) = PointGeometry._;

  /// Creates a Line String geometry.
  factory Geometry.lineString({required Path coordinates}) =
      LineStringGeometry._;

  /// Creates a Polygon geometry.
  factory Geometry.polygon({required List<Path> coordinates}) =
      PolygonGeometry._;

  /// Creates a Geometry from a [vt.Geometry] instance.
  factory Geometry.fromRaw(vt.Geometry geometry) {
    if (geometry is vt.PointGeometry) {
      return Geometry.point(
        coordinates: _toOffset(geometry.coordinates),
      );
    } else if (geometry is vt.LineStringGeometry) {
      return Geometry.lineString(
        coordinates: _toPath(geometry.coordinates, false),
      );
    } else if (geometry is vt.PolygonGeometry) {
      return Geometry.polygon(
        coordinates: geometry.coordinates.map((e) => _toPath(e, true)).toList(),
      );
    } else {
      throw FlutterError('Geometry is unknown.');
    }
  }

  /// Default private constructor.
  const Geometry._();
}

/// Point Geometry.
class PointGeometry extends Geometry {
  /// The default constructor.
  const PointGeometry._({
    required this.coordinates,
  }) : super._();

  /// Coordinates of the PointGeometry.
  final Offset coordinates;
}

/// LineString Geometry.
class LineStringGeometry extends Geometry {
  /// The default constructor.
  const LineStringGeometry._({
    required this.coordinates,
  }) : super._();

  /// Coordinates of the LineStringGeometry.
  final Path coordinates;
}

/// Polygon Geometry.
class PolygonGeometry extends Geometry {
  /// The default constructor.
  const PolygonGeometry._({
    required this.coordinates,
  }) : super._();

  /// Coordinates of the PolygonGeometry.
  final List<Path> coordinates;
}

Offset _toOffset(Point<int> v) {
  return Offset(v.x.toDouble(), v.y.toDouble());
}

Path _toPath(List<Point<int>> geometry, bool close) {
  final points =
      geometry.map((e) => Offset(e.x.toDouble(), e.y.toDouble())).toList();

  return Path()
    ..fillType = PathFillType.evenOdd
    ..addPolygon(points, close);
}
