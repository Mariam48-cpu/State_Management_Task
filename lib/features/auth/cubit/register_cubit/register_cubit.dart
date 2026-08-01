import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_api_26/features/auth/cubit/register_cubit/register_state.dart';
import 'package:ecommerce_app_api_26/features/auth/data/auth_api/auth_api.dart';
import 'package:ecommerce_app_api_26/features/auth/data/models/request/signup_request_model.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register(SignupRequestModel request) async {
    emit(RegisterLoading());

    try {
      final response = await AuthApi.signup(
        request.name ?? "",
        request.email ?? "",
        request.password ?? "",
      );

      emit(RegisterSuccess(response));
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }
}
