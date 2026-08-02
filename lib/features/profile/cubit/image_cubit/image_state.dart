
import 'package:ecommerce_app_api_26/features/profile/data/models/avatar_model.dart';

abstract class ImageState {}

final class ImageInitial extends ImageState {}
final class ImageLoading extends ImageState {}
final class ImageSuccess extends ImageState {
  final AvatarModel avatarModel;
  ImageSuccess(this.avatarModel);}
final class ImageError extends ImageState {
  final String errorMessage;
  ImageError(this.errorMessage);
}