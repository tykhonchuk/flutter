import "dart:typed_data";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:nav/config/pages_route.dart";
import "package:nav/config/theme_dark.dart";
import "package:nav/config/theme_light.dart";
import "package:nav/cubit/counter_cubit.dart";
import "package:nav/cubit/ocr_cubit.dart";
import "package:nav/cubit/swapi_cubit.dart";
import "package:nav/pages/cubit_page.dart";
import "package:nav/pages/first_page.dart";
import "package:nav/pages/ocr_page.dart";
import "package:nav/pages/ocr_result_page.dart";
import "package:nav/pages/second_page.dart";
import "package:nav/pages/swapi_page.dart";


void main() {
  final routeBuilders = {
    PagesRoute.firstPage: (context, state) => const FirstPage(),
    PagesRoute.secondPage: (context, state) => const SecondPage(),
    PagesRoute.thirdPage: (context, state) => BlocProvider(create: (_) => CounterCubit(), child: const CubitPage()),
    PagesRoute.swapiPage: (context, state) => BlocProvider(create: (_) => SwapiCubit(), child: const SwapiPage()),
    PagesRoute.ocrPage: (context, state) => BlocProvider(create: (_) => OCRCubit(), child: const OCRPage()),
    PagesRoute.ocrResultPage: (context, GoRouterState state) {
      final imageBytes = state.extra as Uint8List?;
      return OCRResultPage(imageBytes: imageBytes!);
    },
  };
  final goRoute = GoRouter(
    routes:
      PagesRoute.values.map((route) {
        return GoRoute(path: route.path, name: route.name, builder: routeBuilders[route]);
      }).toList(),
  );
  runApp(
    MaterialApp.router(
      routerConfig: goRoute,
      theme: themeLight,
      darkTheme: themeDark,
    ),
  );
}
