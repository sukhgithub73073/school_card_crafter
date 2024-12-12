part of 'image_pick_bloc.dart';

sealed class ImagePickEvent extends Equatable {
  const ImagePickEvent();
}

class ChangeImagePickEvent extends ImagePickEvent {
  const ChangeImagePickEvent();

  @override
  List<Object?> get props => [];
}

class CaptureImagePickEvent extends ImagePickEvent {
  const CaptureImagePickEvent();

  @override
  List<Object?> get props => [];
}
class ClearImagePickEvent extends ImagePickEvent {
  const ClearImagePickEvent();

  @override
  List<Object?> get props => [];
}