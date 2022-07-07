import 'dart:typed_data';

import 'package:cartography/src/layer.dart';
import 'package:vt/vt.dart' as vt;

/// Vector tile containing multiple layers.
class VectorTile {
  const VectorTile({required this.layers});

  /// Creates a VectorTile from a [vt.VectorTile] instance.
  VectorTile.fromRaw(vt.VectorTile tile)
      : this(layers: tile.layers.map((e) => Layer.fromRaw(e)).toList());

  /// Decodes the given bytes (`.mvt`/`.pbf`) to a [VectorTile]
  factory VectorTile.fromBytes(Uint8List bytes) {
    final n = vt.VectorTile.fromBytes(bytes: bytes);

    return VectorTile.fromRaw(n);
  }

  /// Layers of this VectorTile.
  final List<Layer> layers;
}
