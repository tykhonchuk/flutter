import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  final _goRoute = GoRouter(
    routes:[
      GoRoute(
        path: '/',
        builder: (context, state) => const FirstPage(),
      ),
      GoRoute(
        path:'/second',
        builder:(context, state) => const SecondPage(),
      )
    ],
  );
  return runApp(MaterialApp.router(
    routerConfig: _goRoute,
  ));
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          title: Text(
            "First Page",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
            children: [
              Center(
                child:ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Text('Go route'),
                  onPressed: (){
                    context.go('/second');
                  },
                ),
              ),
              Center(
                child:ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    ),
                    child: Text('Push route'),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context) =>const SecondPage())
                      );
                    }
                ),
              ),
            ]
        ),
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: colorScheme.onTertiaryContainer,
          backgroundColor: colorScheme.tertiaryContainer,
          onPressed: (){},
          label: const Text('Add'),
          icon: const Icon(Icons.add),
        )
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
            "Second Page",
            style: TextStyle(color: Colors.white)
        ),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              style:ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              onPressed: (){
                context.pop();
              },
              child: const Text("Go back"),
            ),
          ),
          Center(
              child: ElevatedButton(
                style:ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text("Push back"),
              )
          ),
          Center(
              child: ElevatedButton(
                onPressed: (){
                  context.go('/');
                },
                child: const Text("Main page"),
              )
          ),
        ],
      ),
    );
  }
}