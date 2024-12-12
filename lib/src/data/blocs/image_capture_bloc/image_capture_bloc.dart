import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:card_craft/src/data/blocs/image_pick_bloc/image_pick_bloc.dart';

part 'image_capture_event.dart';

part 'image_capture_state.dart';

class ImageCaptureBloc extends Bloc<ImageCaptureEvent, ImageCaptureState> {
  ImageCaptureBloc() : super(ImageCaptureInitial()) {
    on<CaptureImageCaptureEvent>(_captureImage);
    on<ClearImageCaptureEvent>(_clearImage);
  }

  Future<void> _captureImage(
      CaptureImageCaptureEvent event, Emitter<ImageCaptureState> emit) async {
    if (state is! ImageCaptureSuccess) return;
    final cast = state as ImageCaptureSuccess;
    List<XFile> list = cast.imagesList;
    var file = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (file != null) {
      emit(ImageCaptureLoading());
      var croppedFile = await _cropImage(file.path);
      if (croppedFile != null) {
        list.add(XFile(croppedFile.path));
        emit(ImageCaptureSuccess(imagesList: list));
      }
    }
  }

  Future<CroppedFile?> _cropImage(String filePath) async {
    return await ImageCropper().cropImage(
      sourcePath: filePath,
      aspectRatio: CropAspectRatio(ratioX: 30, ratioY: 30),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          lockAspectRatio: false,
          showCropGrid: false,
          hideBottomControls: true,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(),
          ],
        ),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPresetCustom(),
            // IMPORTANT: iOS supports only one custom aspect ratio in preset list
          ],
        ),
      ],
    );
  }

  FutureOr<void> _clearImage(
      ClearImageCaptureEvent event, Emitter<ImageCaptureState> emit) {
    emit(ImageCaptureLoading());
    emit(ImageCaptureSuccess(imagesList: []));
  }
}
