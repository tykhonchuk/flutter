part of "swapi_cubit.dart";

sealed class SwapiState {
  const SwapiState();
}

class SwapiStateInitial extends SwapiState {
  const SwapiStateInitial();

}

class SwapiStateLoading extends SwapiState {
  const SwapiStateLoading();
}

class SwapiStateSuccess extends SwapiState {
  const SwapiStateSuccess({required this.id, required this.name, required this.gender, required this.eyeColor, required this.hairColor, required this.height, required this.birthYear});

  final String id;
  final String name;
  final String gender;
  final String eyeColor;
  final String hairColor;
  final String height;
  final String birthYear;
}

class SwapiStateError extends SwapiState {
  const SwapiStateError({this.error});

  final Object? error;
}
