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
class _ProviderState extends State<Provider> with WidgetsBindingObserver {
  void _log(String method, { String? message }) {
    print("($hashCode:${controller.hashCode}) [ Provider | $method ] ${message != null ? message : ""}");
  }

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
    WidgetsBinding.instance!.addPostFrameCallback((Duration timestamp) {
      _log("addPostFrameCallback", message: "timestamp: $timestamp");
      controller.builded();
    });
    WidgetsBinding.instance!.addObserver(this);
    _log("initState");
  }

  @override
  Widget build(BuildContext context) {
    _log("build");
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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    _log("didChangeAppLifecycleState", message: "state: $state");
  }

  @override
  void deactivate() {
    super.deactivate();

    _log("deactivate");
  }

  @override
  Future<bool> didPopRoute() {
    _log("didPopRoute");
    return super.didPopRoute();
  }

  @override
  Future<bool> didPushRoute(String route) {
    _log("didPushRoute", message: "route: $route");
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    _log("didPushRouteInformation", message: "routeInformation: $routeInformation");
    return super.didPushRouteInformation(routeInformation);
  }

  @override
  void dispose() {
    _log("dispose");
    // Dispose widget
    super.dispose();
    // Dispose controller
    controller.dispose();

    WidgetsBinding.instance!.removeObserver(this);
  }
}