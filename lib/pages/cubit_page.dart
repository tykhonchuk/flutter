import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:nav/config/pages_route.dart";
import "package:nav/cubit/counter_cubit.dart";

class CubitPage extends StatelessWidget {
  const CubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, int>(
      builder:
          (context, count) => Scaffold(
            appBar: AppBar(title: const Text("Cubit Page")),
            body: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.go(PagesRoute.firstPage.path);
                    },
                    child: const Text("Main page"),
                  ),
                  Text("Count: $count"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.read<CounterCubit>().increment(),
                        child: const Text("Increment"),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () => context.read<CounterCubit>().decrement(),
                        child: const Text("Decrement"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
