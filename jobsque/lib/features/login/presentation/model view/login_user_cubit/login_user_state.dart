part of 'login_user_cubit.dart';

@immutable
sealed class LoginUserState {}

final class LoginUserInitial extends LoginUserState {}

final class LoginUserLoading extends LoginUserState {}

final class LoginUserSuccess extends LoginUserState {
  final UserLoginModel userLogin;

  LoginUserSuccess(this.userLogin);
}

final class LoginUserFailure extends LoginUserState {
  final String errMessage;

  LoginUserFailure(this.errMessage);
}
