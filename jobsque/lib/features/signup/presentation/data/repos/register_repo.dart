import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/register_model/user.dart';

abstract class RegisterRepo {
  Future<Either<Failure, UserModel>> registerUser({
    required String name,
    required String email,
    required String password,
  });
}
