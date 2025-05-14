part of "ocr_cubit.dart";

sealed class OCRState{
  const OCRState();
}

class OCRStateInitial extends OCRState{
  const OCRStateInitial();
}

class OCRStateLoading extends OCRState{
  const OCRStateLoading();
}

class OCRStateSuccess extends OCRState {
  const OCRStateSuccess({required this.text});

  final String text;
}

class OCRStateError extends OCRState{
  const OCRStateError({this.error});

  final Object? error;
}
