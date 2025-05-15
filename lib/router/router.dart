import 'package:flutter/material.dart';

/// A function to define the routes for the application.
Map<String, WidgetBuilder> buildAppRoutes() {
  return {"/": (context) => const Scaffold(body: Center(child: Text("Home")))};
}
