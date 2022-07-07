[![pub package](https://img.shields.io/pub/v/cartography.svg)](https://pub.dartlang.org/packages/cartography)

Vector tile extension for [Map](https://pub.dev/packages/map) package. Paint vector tiles layers on the Map.

## Features

* VectorTile
* Layer
* Feature
* Geometry
* Properties

## Getting started

In your `pubspec.yaml` file add:

```dart
dependencies:
  cartography: any
```

## Usage

In your code import:

```dart
import 'package:cartography/cartography.dart';
```

Then:

```dart
final tile = VectorTile.fromBytes(fileContents);
```
