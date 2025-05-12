import "package:flutter_bloc/flutter_bloc.dart";

part "ocr_state.dart";

class OCRCubit extends Cubit<OCRState> {
  OCRCubit() : super(const OCRStateInitial());

  void updateRecognizedText(String text) {
    emit(const OCRStateLoading());
    try {
      emit(OCRStateSuccess(text: text));
    } catch (e) {
      emit(OCRStateError(error: "$e"));
    }
  }

  void emitError(String message){
    emit(OCRStateError(error: message));
  }
}
