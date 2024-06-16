import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pragma_jmancilla/features/search_cats/domain/usecases/get_cat_image_url.dart';

part 'image_event.dart';

part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final GetCatImage getImageUrl;

  ImageBloc({required this.getImageUrl}) : super(ImageInitial()) {
    on<FetchImage>(_onFetchImage);
  }

  void _onFetchImage(FetchImage event, Emitter<ImageState> emit) async {
    emit(ImageLoading());
    try {
      final url = await getImageUrl(event.referenceImageId);
      emit(ImageLoaded(url));
    } catch (_) {
      emit(ImageError());
    }
  }
}
