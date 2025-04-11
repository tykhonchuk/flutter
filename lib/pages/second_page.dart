import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav/main.dart';


class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            "Second Page",
        ),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: (){
                context.pop();
              },
              child: const Text("Go back"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                context.pop();
              },
              child: const Text("Push back"),
            )
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){
                context.go(PagesRoute.firstPage.path);
              },
              child: const Text("Main page"),
            )
          ),
        ],
      ),
    );
  }
}