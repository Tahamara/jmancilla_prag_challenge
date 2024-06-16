part of 'cat_bloc.dart';

abstract class CatEvent extends Equatable {
  const CatEvent();

  @override
  List<Object> get props => [];
}

final class CatsFetched extends CatEvent {}

class CatsFiltered extends CatEvent {
  final String name;

  const CatsFiltered(this.name);

  @override
  List<Object> get props => [name];
}