import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_api_26/features/profile/cubit/image_cubit/image_state.dart';
import 'package:ecommerce_app_api_26/features/profile/data/models/avatar_model.dart';
import 'package:ecommerce_app_api_26/features/profile/data/profile_api/profile_api.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());



  Future<void> updateImage({
    required File imageFile,
    required int userId,
  }) async {
    emit(ImageLoading());

    try {
      AvatarModel avatarModel = await ProfileApi().uploadImage(imageFile);

      await ProfileApi().updateProfileAvatar(
        userId,
        avatarModel.location!,
      );

      emit(ImageSuccess(avatarModel));
    } catch (e) {
      emit(ImageError(e.toString()));
    }
  }
}