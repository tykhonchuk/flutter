import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:nav/config/pages_route.dart";

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("First Page")),
      body: Column(
        children: [
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
              child: const Text("Swapi Cubit"),
              onPressed: () {
                context.push(PagesRoute.swapiPage.path);
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
