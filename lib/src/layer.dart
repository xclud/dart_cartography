import 'package:vt/vt.dart' as vt;

import 'feature.dart';

/// Layers are described in section 4.1 of the specification.
class Layer {
  /// The default constructor.
  const Layer({
    required this.name,
    required this.extent,
    required this.features,
    required this.version,
  });

  /// Creates a Layer from a [vt.Layer] instance.
  Layer.fromRaw(vt.Layer layer)
      : this(
          extent: layer.extent,
          name: layer.name,
          features: layer.features.map((e) => Feature.fromRaw(e)).toList(),
          version: layer.version,
        );

  /// Name of the Layer.
  final String name;

  /// Extent of the layer.
  final int extent;

  /// Version of the layer.
  final int version;

  /// Features of the layer.
  final List<Feature> features;
}
