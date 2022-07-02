import 'package:vt/vt.dart' as vt;

import 'geometry.dart';

class Feature {
  const Feature({
    required this.properties,
    required this.geometries,
  });

  Feature.fromRaw(vt.Feature feature)
      : this(
          properties: feature.properties,
          geometries:
              feature.geometries.map((e) => Geometry.fromRaw(e)).toList(),
        );

  final Map<String, dynamic> properties;
  final List<Geometry> geometries;
}
