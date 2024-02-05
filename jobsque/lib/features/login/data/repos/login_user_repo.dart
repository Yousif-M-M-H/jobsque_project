import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/register_model/user.dart';

abstract class LoginUserRepo {
  Future<Either<Failure, UserModel>> loginUser({
    required String email,
    required String password,
  });
}
