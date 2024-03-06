import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/home_models/user_login_model.dart';

abstract class LoginUserRepo {
  Future<Either<Failure, UserLoginModel>> loginUser({
    required String email,
    required String password,
  });
}
