import 'package:bloc/bloc.dart';
import 'package:jobsque/core/models/register_model/user.dart';
import 'package:jobsque/features/login/data/repos/login_user_repo.dart';
import 'package:meta/meta.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit(this.loginUserRepo) : super(LoginUserInitial());

  final LoginUserRepo loginUserRepo;

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginUserLoading());
    var result =
        await loginUserRepo.loginUser(email: email, password: password);

    result.fold((failure) {
      emit(LoginUserFailure(failure.errMessage));
    }, (users) {
      emit(LoginUserSuccess(users));
    });
  }
}
