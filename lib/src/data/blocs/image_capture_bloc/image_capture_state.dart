part of 'image_capture_bloc.dart';

sealed class ImageCaptureState extends Equatable {
  const ImageCaptureState();
}

final class ImageCaptureInitial extends ImageCaptureState {
  @override
  List<Object> get props => [];
}
final class ImageCaptureLoading extends ImageCaptureState {
  @override
  List<Object> get props => [];
}
final class ImageCaptureSuccess extends ImageCaptureState {
  final List<XFile> imagesList ;

  ImageCaptureSuccess({required this.imagesList});
  @override
  List<Object> get props => [imagesList];
}
final class ImageCaptureError extends ImageCaptureState {
  final String error;

  ImageCaptureError({required this.error});
  @override
  List<Object> get props => [error];
}
