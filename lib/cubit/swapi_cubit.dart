import "dart:convert" as convert;
import "package:flutter_bloc/flutter_bloc.dart";
import "package:http/http.dart" as http;

part "swapi_state.dart";

class SwapiCubit extends Cubit<SwapiState> {
  SwapiCubit() : super(const SwapiStateInitial());

  Future<void> fetchPerson(int id) async {
    emit(const SwapiStateLoading());
    try {
      final url = Uri.https("swapi.tech", "/api/people/$id");
      final response = await http.get(url);

      if (response.statusCode != 200) {
        emit(SwapiStateError(error: "Network error: ${response.statusCode}"));
        return;
      }
      final json = convert.jsonDecode(response.body) as Map<String, dynamic>;

      final result = json["result"] as Map<String, dynamic>;
      final properties = result["properties"] as Map<String, dynamic>;

      emit(SwapiStateSuccess(
          id: result["uid"].toString(),
          name: properties["name"].toString(),
          gender: properties["gender"].toString(),
          eyeColor: properties["eye_color"].toString(),
          hairColor: properties["hair_color"].toString(),
          height: properties["height"].toString(),
          birthYear: properties["birth_year"].toString(),
      ),);
   } catch (e) {
    emit(SwapiStateError(error: "$e"));
   }
  }

  void emitError(String message){
    emit(SwapiStateError(error: message));
  }
}
