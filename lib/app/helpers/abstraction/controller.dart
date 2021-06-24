import 'package:flutter/material.dart';

/// Controller
abstract class Controller {
  /// Initilization
  void init(BuildContext context);

  /// Build screen
  void build() /** optional */ {}

  /// Builded screen
  void builded() /** optional */ {}

  /// Disepose screem
  void dispose();
}