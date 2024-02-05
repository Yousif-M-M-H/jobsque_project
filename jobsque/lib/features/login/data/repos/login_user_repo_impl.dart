import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/register_model/user.dart';
import 'package:jobsque/core/utils/api_service.dart';
import 'package:jobsque/features/login/data/repos/login_user_repo.dart';

class LoginUserRepoImpl implements LoginUserRepo {
  final ApiService apiService;

  LoginUserRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UserModel>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'email': email,
        'password': password,
      };

      final Map<String, dynamic> responseData = await apiService.register(
        endPoint: 'auth/login',
        data: data,
      );

      final UserModel userModel = UserModel.fromJson(responseData);

      return Right(userModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
