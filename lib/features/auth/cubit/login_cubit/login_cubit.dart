import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_api_26/features/auth/cubit/login_cubit/login_state.dart';
import 'package:ecommerce_app_api_26/features/auth/data/auth_api/auth_api.dart';
import 'package:ecommerce_app_api_26/features/auth/data/models/request/login_request_model.dart';
import 'package:ecommerce_app_api_26/features/auth/data/models/response/login_response_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> login(LoginRequestModel request) async {
    emit(LoginLoading());
    try {
      LoginResponseModel response = await AuthApi.login(
        email: request.email ?? " ",
        password: request.password ?? " ",
      );
      emit(LoginSuccess(response));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
