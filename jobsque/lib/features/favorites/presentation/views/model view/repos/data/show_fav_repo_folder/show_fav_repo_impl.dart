import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/home_models/fav_jobs_model.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/core/utils/api_service.dart';
import 'package:jobsque/features/favorites/presentation/views/model%20view/repos/data/show_fav_repo_folder/show_fav_repo.dart';

class ShowFavRepoImpl implements ShowFavRepo {
  final ApiService apiService;
  final TokenStorage tokenStorage = TokenStorage();

  ShowFavRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ShowAllFavModel>> showAllFavs() async {
    try {
      String? bearerToken = await tokenStorage.getToken();

      // ignore: avoid_print
      print('showing all favorites...');

      final Map<String, dynamic> responseData = await apiService
          .getAllFavsApiService(
              data: {'user_id': 1476},
              endPoint: 'favorites',
              bearerToken: bearerToken);

      final ShowAllFavModel jobsModel = ShowAllFavModel.fromJson(responseData);
      // ignore: avoid_print
      print('All Jobs Showed Successfully.');

      return Right(jobsModel);
    } catch (e) {
      if (e is DioException) {
        print('Error while adding job with ID $id to favorites: $e');

        return left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
