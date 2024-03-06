import 'package:bloc/bloc.dart';
import 'package:jobsque/core/models/home_models/user_login_model.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/features/login/data/repos/login_user_repo.dart';
// ignore: depend_on_referenced_packages
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
    }, (userLogin) {
      if (userLogin.token != null && userLogin.user?.id != null) {
        TokenStorage tokenStorage = TokenStorage();
        tokenStorage.saveToken(userLogin.token!);
        tokenStorage.saveUserId(userLogin.user!.id!);

        emit(
          LoginUserSuccess(userLogin),
        );
      } else {
        emit(LoginUserFailure("Login failed due to missing token or user ID."));
      }
    });
  }
}
