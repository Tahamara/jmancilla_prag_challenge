part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class FetchImage extends ImageEvent {
  final String referenceImageId;

  FetchImage(this.referenceImageId);

  @override
  List<Object> get props => [referenceImageId];
}
