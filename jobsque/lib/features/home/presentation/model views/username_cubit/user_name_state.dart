part of 'user_name_cubit.dart';

@immutable
sealed class UserNameState {}

final class UserNameInitial extends UserNameState {}

final class UserNameLoaded extends UserNameState {
  final String username;

  UserNameLoaded(this.username);
}
