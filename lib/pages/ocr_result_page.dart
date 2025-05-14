import "dart:typed_data";
import "package:flutter/material.dart";

class OCRResultPage extends StatelessWidget {
  const OCRResultPage({required this.imageBytes, super.key});

  final Uint8List imageBytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OCR Result")),
      body: Center(
        child: Image.memory(imageBytes) ,
      ),
    );
  }
}
