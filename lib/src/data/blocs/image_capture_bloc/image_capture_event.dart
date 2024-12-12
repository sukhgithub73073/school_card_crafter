part of 'image_capture_bloc.dart';

sealed class ImageCaptureEvent extends Equatable {
  const ImageCaptureEvent();
}

class CaptureImageCaptureEvent extends ImageCaptureEvent {
  const CaptureImageCaptureEvent();

  @override
  List<Object?> get props => [];
}

class ClearImageCaptureEvent extends ImageCaptureEvent {
  const ClearImageCaptureEvent();

  @override
  List<Object?> get props => [];
}