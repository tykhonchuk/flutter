import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "First Page",
        ),
      ),
      body: Column(
        children: [
          Center(
            child:ElevatedButton(
              child: Text('Go route'),
              onPressed: (){
                context.go(PagesRoute.secondPage.path);
              },
            ),
          ),
          Center(
            child:ElevatedButton(
              child: Text('Push route'),
              onPressed: (){
                context.push(PagesRoute.secondPage.path);
              }
            ),
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      )
    );
  }
}