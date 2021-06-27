import 'package:flutter/material.dart';
import 'package:payflow/app/helpers/abstraction/controller.dart';

typedef Page = Widget Function();

/// Provide controller for descendant widgets
class Provider<T extends Controller> extends StatefulWidget {

  final T controller;
  final Page page;
  final bool useMaterial;

  const Provider({
    Key? key,
    required this.controller,
    required this.page,
    this.useMaterial = false
  }): super(key: key);

  /// Get controller
  static T of<T extends Controller>(BuildContext context) {
    // Finding provider widget
    Provider<T> provider = context.findAncestorWidgetOfExactType<Provider<T>>()!;
    // Return provider widget controller
    return provider.controller;
  }

  @override
  _ProviderState createState() {
    return _ProviderState();
  }
}

/// Provider state links the lifecycle methods with the controller, thus
/// abstracting business logic outside of visualization.
class _ProviderState extends State<Provider> {

  Page get page => this.widget.page;
  Controller get controller => this.widget.controller;
  bool get useMaterial => this.widget.useMaterial;

  @override
  void initState() {
    // Initialize state
    super.initState();
    // Initialize controller with context
    controller.init(context);
    // Add callback to first build
    WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) {
      controller.builded();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build/update page
    controller.build();
    // Retun page
    if(useMaterial) return Material(
      color: Colors.transparent,
      child: page(),
    );
    return page();
  }

  @override
  void dispose() {
    // Dispose controller
    controller.dispose();
    // Dispose widget
    super.dispose();
  }
}