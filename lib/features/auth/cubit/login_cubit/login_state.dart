import 'package:ecommerce_app_api_26/features/auth/data/models/response/login_response_model.dart';
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginResponseModel response;
  LoginSuccess(this.response);
}

class LoginError extends LoginState {
  final String? message;
  LoginError(this.message);
}
