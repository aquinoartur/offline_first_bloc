import 'package:equatable/equatable.dart';

abstract class SearchFailure extends Equatable implements Exception {}

class AnimeError extends SearchFailure {
  final String message;
  AnimeError({
    required this.message,
  });

  @override
  List<Object?> get props => [];
}

class DatasourceError extends SearchFailure {
  final String message;
  DatasourceError({
    required this.message,
  });
  @override
  List<Object?> get props => [];
}

class DatasourceException extends Equatable implements SearchFailure {
  @override
  List<Object?> get props => [];
}
