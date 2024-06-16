import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pragma_jmancilla/core/transformers/throttle_transform.dart';
import '../../../domain/entities/cat.dart';
import '../../../domain/usecases/filter_cats.dart';
import '../../../domain/usecases/get_cats.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final GetCats getCats;
  final FilterCats filterCats;

  CatBloc({required this.getCats, required this.filterCats})
      : super(const CatState(
            status: CatStatus.initial,
            cats: [],
            hasReachedMax: false,
            page: 0)) {
    on<CatsFetched>(
      _onCatFetch,
      transformer: throttleDroppable(throttleDuration),
    );
    on<CatsFiltered>(
      _onCatFiltered,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  void _onCatFetch(CatEvent event, Emitter<CatState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == CatStatus.initial) {
        final cats = await getCats();
        return emit(
          state.copyWith(
              status: CatStatus.success,
              cats: cats,
              hasReachedMax: false,
              page: state.page + 1),
        );
      }
      final cats = await getCats(state.page);
      cats.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                  status: CatStatus.success,
                  cats: List.of(state.cats)..addAll(cats),
                  hasReachedMax: false,
                  page: state.page + 1),
            );
    } catch (_) {
      emit(state.copyWith(status: CatStatus.failure));
    }
  }

  void _onCatFiltered(CatsFiltered event, Emitter<CatState> emit) async {
    if (event.name.isEmpty) {
      emit(
        state.copyWith(
            status: CatStatus.initial, cats: [], hasReachedMax: false, page: 0),
      );
      add(CatsFetched());
      return;
    }
    try {
      final cats = await filterCats(event.name);
      emit(
        state.copyWith(
          status: CatStatus.success,
          cats: cats,
          hasReachedMax: true,
          page: 0,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: CatStatus.failure));
    }
  }
}
