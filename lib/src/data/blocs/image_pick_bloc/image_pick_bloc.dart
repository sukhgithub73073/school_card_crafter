import 'dart:async';
import 'dart:io';

import 'package:background_remover/background_remover.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

part 'image_pick_event.dart';

part 'image_pick_state.dart';

class ImagePickBloc extends Bloc<ImagePickEvent, ImagePickState> {
  ImagePickBloc() : super(ImagePickInitial()) {
    on<ChangeImagePickEvent>(_onImageChange);
    on<CaptureImagePickEvent>(_onImageCapture);
    on<ClearImagePickEvent>(_onImageClear);
  }

  Future<FutureOr<void>> _onImageChange(
      ChangeImagePickEvent event, Emitter<ImagePickState> emit) async {
    var file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    emit(ImagePickLoading());
    if (file != null) {
      var croppedFile = await _cropImage(file.path);
      if (croppedFile != null) {
        emit(ImagePickSuccess(file: XFile(croppedFile.path)));
      } else {
        emit(ImagePickError(error: "Image cropping canceled"));
      }
    } else {
      emit(ImagePickError(error: "Please pick any image"));
    }
  }

  Future<FutureOr<void>> _onImageCapture(
      CaptureImagePickEvent event, Emitter<ImagePickState> emit) async {
    var file = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    emit(ImagePickLoading());
    if (file != null) {
      var croppedFile = await _cropImage(file.path);
      if (croppedFile != null) {
        emit(ImagePickSuccess(file: XFile(croppedFile.path)));
      } else {
        emit(ImagePickError(error: "Image cropping canceled"));
      }
    } else {
      emit(ImagePickError(error: "Please pick any image"));
    }
  }

  FutureOr<void> _onImageClear(
      ClearImagePickEvent event, Emitter<ImagePickState> emit) {
    emit(ImagePickReset());
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


      // uiSettings: [
      //   AndroidUiSettings(
      //     toolbarTitle: 'Cropper',
      //     lockAspectRatio: false,
      //     cropStyle: CropStyle.circle,
      //     showCropGrid: false,
      //     hideBottomControls: true,
      //     aspectRatioPresets: [
      //       CropAspectRatioPreset.original,
      //       CropAspectRatioPresetCustom(),
      //     ],
      //   ),
      //   IOSUiSettings(
      //     title: 'Cropper',
      //     aspectRatioPresets: [
      //       CropAspectRatioPreset.original,
      //       CropAspectRatioPreset.square,
      //       CropAspectRatioPresetCustom(),
      //       // IMPORTANT: iOS supports only one custom aspect ratio in preset list
      //     ],
      //   ),
      // ],
    );
  }
}

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (2, 3);

  @override
  String get name => '2x3 (customized)';
}
