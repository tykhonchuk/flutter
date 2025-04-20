import "dart:convert" as convert;

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:http/http.dart" as http;

part "swapi_state.dart";

class SwapiCubit extends Cubit<SwapiState> {
  SwapiCubit(this.id) : super(const SwapiStateInitial());

  final int? id;

  Future<void> fetchPerson(int id) async {
    emit(const SwapiStateLoading());
    try {
      final url = Uri.https("swapi.tech", "/api/people/$id");
      final response = await http.get(url);
      final json = convert.jsonDecode(response.body) as Map<String, dynamic>;

      emit(SwapiStateSuccess(id: id.toString()));
   } catch (e) {
    emit(SwapiStateError(error: "Błąd pobierania danych: $e"));
   }
}

}