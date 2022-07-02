import 'dart:typed_data';

import 'package:cartography/src/layer.dart';
import 'package:vt/vt.dart' as vt;

class VectorTile {
  const VectorTile({required this.layers});

  VectorTile.fromRaw(vt.VectorTile tile)
      : this(layers: tile.layers.map((e) => Layer.fromRaw(e)).toList());

  factory VectorTile.fromBytes(Uint8List bytes) {
    final n = vt.VectorTile.fromBytes(bytes: bytes);

    return VectorTile.fromRaw(n);
  }

  final List<Layer> layers;
}
