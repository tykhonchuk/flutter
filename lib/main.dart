import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'Pages/first_page.dart';
import 'Pages/second_page.dart';


enum PagesRoute {
  firstPage ('/', 'First Page'),
  secondPage ('/second', 'Second Page');

  const PagesRoute(this.path, this.name);
  final String path;
  final String name;
}

void main() {
  final routeBuilders = {
    PagesRoute.firstPage: (context, state) => const FirstPage(),
    PagesRoute.secondPage: (context, state) => const SecondPage(),
  };
  final goRoute = GoRouter(
    routes: PagesRoute.values.map((route) {
      return GoRoute(
        path: route.path,
        name: route.name,
        builder: routeBuilders[route]
      );
    }).toList(),
  );
  return runApp(MaterialApp.router(
    routerConfig: goRoute,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      useMaterial3: true
    ),
    darkTheme: ThemeData(
      colorScheme: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Colors.lightGreen),
      useMaterial3: true,
    ),
  ));
}
