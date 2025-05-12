import "dart:developer";
import "dart:typed_data";
import "dart:ui";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_scalable_ocr/flutter_scalable_ocr.dart";
import "package:go_router/go_router.dart";
import "package:nav/config/pages_route.dart";
import "package:nav/cubit/ocr_cubit.dart";

class OCRPage extends StatefulWidget {
  const OCRPage({super.key});

  @override
  State<OCRPage> createState() => _OcrPageState();
}

class _OcrPageState extends State<OCRPage> {
  String recognizedText = "";
  GlobalKey previewContainer = GlobalKey();

  Future<Uint8List?> capturePreview() async {
    try {
      final renderObject = previewContainer.currentContext?.findRenderObject();
      if (renderObject is! RenderRepaintBoundary) {
        return null;
      }
      final image = await renderObject.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      debugPrint("Screenshot error: $e");
      return null;
    }
  }

  Future<void> goToResultPage(BuildContext context, OCRState state) async {
    final navigator = GoRouter.of(context);
    final imageBytes = await capturePreview();
    if (imageBytes != null && state is OCRStateSuccess) {
      await navigator.push(
        PagesRoute.ocrResultPage.path,
        extra: imageBytes,
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OCRCubit, OCRState>(
      builder: (context, state) {
        final cubit = context.read<OCRCubit>();

        return Scaffold(
          appBar: AppBar(title: const Text("OCR Page")),
          body: Column(
            children: [
              RepaintBoundary(
                key: previewContainer,
                child: ScalableOCR(
                  paintboxCustom: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 4.0
                    ..color = const Color.fromARGB(153, 102, 160, 241),
                  boxLeftOff: 11,
                  boxBottomOff: 6.7,
                  boxRightOff: 11,
                  boxTopOff: 6.7,
                  boxHeight: MediaQuery.of(context).size.height / 5,
                  getRawData: (dynamic value) {
                    inspect(value);
                  },
                  getScannedText: (dynamic value) {
                    cubit.updateRecognizedText(value as String);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => goToResultPage(context, state),
                  child: const Text("Take screenshot"),
                ),
              ),
              if (state is OCRStateSuccess)
                Text("Recognized text: ${state.text}"),
            ],
          ),
        );
      },
    );
  }
}
