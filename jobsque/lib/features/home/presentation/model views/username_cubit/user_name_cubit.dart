import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_name_state.dart';

class UserNameCubit extends Cubit<UserNameState> {
  UserNameCubit() : super(UserNameInitial());

  void updateUser(String username) {
    emit(UserNameLoaded(username));
  }
}
