part of 'cat_bloc.dart';

enum CatStatus { initial, success, failure }

final class CatState extends Equatable {
  final CatStatus status;
  final List<Cat> cats;
  final bool hasReachedMax;
  final int page;

  const CatState({
    required this.status,
    required this.cats,
    required this.hasReachedMax,
    required this.page,
  });

  @override
  String toString() {
    return 'CatState{status: $status, cats: $cats, hasReachedMax: $hasReachedMax}';
  }

  CatState copyWith(
      {CatStatus? status, List<Cat>? cats, bool? hasReachedMax, int? page}) {
    return CatState(
        status: status ?? this.status,
        cats: cats ?? this.cats,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        page: page ?? this.page);
  }

  @override
  List<Object?> get props => [status, cats, hasReachedMax, page];
}
