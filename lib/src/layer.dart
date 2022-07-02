import 'package:vt/vt.dart' as vt;

import 'feature.dart';

class Layer {
  const Layer({
    required this.name,
    required this.extent,
    required this.features,
    required this.version,
  });

  Layer.fromRaw(vt.Layer layer)
      : this(
          extent: layer.extent,
          name: layer.name,
          features: layer.features.map((e) => Feature.fromRaw(e)).toList(),
          version: layer.version,
        );

  final String name;
  final int extent;
  final int version;
  final List<Feature> features;
}
