import 'package:equatable/equatable.dart';

class CommonState extends Equatable {
  const CommonState({this.statusCode});
  final int? statusCode;
  @override
  List<Object?> get props => [];
}

class CommonInitial extends CommonState {}

class CommonLoading extends CommonState {}

class CommonDummyLoading extends CommonState {}

class CommonError extends CommonState {
  final String message;
  const CommonError({required this.message, super.statusCode});
  bool get isNoConnection => statusCode == 1000;
  @override
  List<Object?> get props => [message];
}

class CommonNoData extends CommonState {
  const CommonNoData();
  @override
  List<Object?> get props => [];
}

class CommonDataFetchSuccess<T> extends CommonState {
  final List<T> data;
  const CommonDataFetchSuccess({required this.data});
  @override
  List<T> get props => [...data];
}

class CommonStateSuccess<T> extends CommonState {
  final T data;
  const CommonStateSuccess({required this.data});
  @override
  List<T> get props => [data];
}
