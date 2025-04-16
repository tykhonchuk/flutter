import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:nav/config/pages_route.dart";
import "package:nav/cubit/counter_cubit.dart";

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("First Page")),
      body: Column(
        children: [
          BlocBuilder<CounterCubit, int>(
            builder: (context, count) {
              return Text("Count: $count");
            },
          ),
          Center(
            child: ElevatedButton(
              child: const Text("Go route"),
              onPressed: () {
                context.go(PagesRoute.secondPage.path);
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text("Push route"),
              onPressed: () {
                context.push(PagesRoute.secondPage.path);
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text("Cubit counter"),
              onPressed: () {
                context.push(PagesRoute.thirdPage.path);
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text("Auth page"),
              onPressed: () {
                context.push(PagesRoute.authPage.path);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Add"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
