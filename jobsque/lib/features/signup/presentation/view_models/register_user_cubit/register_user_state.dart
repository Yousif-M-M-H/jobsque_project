part of 'register_user_cubit.dart';

@immutable
sealed class RegisterUserState {}

final class RegisterUserInitial extends RegisterUserState {}

final class RegisterUserLoading extends RegisterUserState {}

final class RegisterUserFailure extends RegisterUserState {
  final String errMessage;

  RegisterUserFailure(this.errMessage);
}

final class RegisterUserSuccess extends RegisterUserState {
  final UserModel user;

  RegisterUserSuccess(this.user);
}
