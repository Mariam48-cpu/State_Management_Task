import 'package:ecommerce_app_api_26/features/auth/data/models/response/signup_response_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  SignupResponseModel response;
  RegisterSuccess(this.response);
}

class RegisterError extends RegisterState {
  final String? message;
  RegisterError(this.message);
}
