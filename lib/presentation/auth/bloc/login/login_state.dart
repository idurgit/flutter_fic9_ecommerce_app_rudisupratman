part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.error(String messsage) = _Error;
  const factory LoginState.success(AuthResponseModel data) = _Success;
}