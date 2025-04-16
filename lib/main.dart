import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:nav/config/pages_route.dart";
import "package:nav/config/theme_dark.dart";
import "package:nav/config/theme_light.dart";
import "package:nav/cubit/auth_cubit.dart";
import "package:nav/cubit/counter_cubit.dart";
import "package:nav/pages/auth_page.dart";
import "package:nav/pages/cubit_page.dart";
import "package:nav/pages/first_page.dart";
import "package:nav/pages/second_page.dart";

void main() {
  final routeBuilders = {
    PagesRoute.firstPage: (context, state) => BlocProvider(create: (_) => CounterCubit(), child: const FirstPage()),
    PagesRoute.secondPage: (context, state) => const SecondPage(),
    PagesRoute.thirdPage: (context, state) => BlocProvider(create: (_) => CounterCubit(), child: const CubitPage()),
    PagesRoute.authPage: (context, state) => BlocProvider(create: (_) => AuthCubit(), child: const AuthPage()),
  };
  final goRoute = GoRouter(
    routes:
        PagesRoute.values.map((route) {
          return GoRoute(path: route.path, name: route.name, builder: routeBuilders[route]);
        }).toList(),
  );
  runApp(MaterialApp.router(routerConfig: goRoute, theme: themeLight, darkTheme: themeDark));
}
