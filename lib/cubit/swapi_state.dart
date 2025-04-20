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
  const SwapiStateSuccess({required this.id, this.displayName});

  final String id;
  final String? displayName;
}

class SwapiStateError extends SwapiState {
  const SwapiStateError({this.error});

  final Object? error;
}