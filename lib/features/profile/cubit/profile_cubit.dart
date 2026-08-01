import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_api_26/features/profile/data/models/profile_model.dart';
import 'package:ecommerce_app_api_26/features/profile/data/profile_api/profile_api.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  Future<void> getProfile() async {
    emit(ProfileLoading());
    try {
      ProfileModel profileModel = await ProfileApi().getProfile();
      emit(ProfileSuccess(profileModel));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
