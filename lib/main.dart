// @TODO: Double quote the import statements
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import "package:nav/config/pages_route.dart";
import "package:nav/config/theme_light.dart";

// @TODO: Use "package:your_project_name/..." for imports
import 'Pages/first_page.dart';
import 'Pages/second_page.dart';

void main() {
  final routeBuilders = {
    PagesRoute.firstPage: (context, state) => const FirstPage(),
    PagesRoute.secondPage: (context, state) => const SecondPage(),
  };
  final goRoute = GoRouter(
    routes:
        PagesRoute.values.map((route) {
          return GoRoute(path: route.path, name: route.name, builder: routeBuilders[route]);
        }).toList(),
  );
  return runApp(
    MaterialApp.router(
      routerConfig: goRoute,
      // @TODO: Move the theme to a separate file. Just like the theme_light.dart
      theme: themeLight,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Colors.lightGreen),
        useMaterial3: true,
      ),
    ),
  );
}
