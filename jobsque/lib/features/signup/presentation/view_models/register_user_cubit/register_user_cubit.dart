import 'package:bloc/bloc.dart';
import 'package:jobsque/core/models/register_model/user.dart';
import 'package:jobsque/features/signup/presentation/data/repos/register_repo.dart';
import 'package:meta/meta.dart';

part 'register_user_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit(this.registerRepo) : super(RegisterUserInitial());

  final RegisterRepo registerRepo;

  Future<void> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    emit(RegisterUserLoading());
    var result = await registerRepo.registerUser(
        name: name, email: email, password: password);

    result.fold((failure) {
      emit(RegisterUserFailure(failure.errMessage));
    }, (users) {
      emit(RegisterUserSuccess(users));
    });
  }
}
