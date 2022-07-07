import 'package:vt/vt.dart' as vt;

import 'geometry.dart';

/// Features are described in section 4.2 of the specification.
class Feature {
  /// The default constructor.
  const Feature({
    required this.id,
    required this.properties,
    required this.geometries,
  });

  /// Creates a Feature from a [vt.Feature] instance.
  Feature.fromRaw(vt.Feature feature)
      : this(
          id: feature.id,
          properties: feature.properties
              .map((key, value) => MapEntry(key, _getValue(value))),
          geometries:
              feature.geometries.map((e) => Geometry.fromRaw(e)).toList(),
        );

  /// Id of this feature.
  final int id;

  /// Properties of this feature.
  final Map<String, dynamic> properties;

  /// Geometries of this feature.
  final List<Geometry> geometries;
}

dynamic _getValue(vt.Value v) {
  if (v.doubleValue != null) return v.doubleValue!;
  if (v.floatValue != null) return v.floatValue!;
  if (v.intValue != null) return v.intValue!.toInt();
  if (v.uintValue != null) return v.uintValue!.toInt();
  if (v.sintValue != null) return v.sintValue!.toInt();
  if (v.stringValue != null) return v.stringValue!;
  if (v.boolValue != null) return v.boolValue!;

  assert(false, 'Invalid Value.');
  return null;
}
