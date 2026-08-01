part of 'profile_cubit.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileSuccess extends ProfileState {
  final ProfileModel profileModel;
  ProfileSuccess(this.profileModel);}
final class ProfileError extends ProfileState {
  final String errorMessage;
  ProfileError(this.errorMessage);
}