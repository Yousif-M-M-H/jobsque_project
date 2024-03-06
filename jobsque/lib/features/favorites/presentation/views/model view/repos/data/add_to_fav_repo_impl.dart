import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/home_models/fav_jobs_model.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/core/utils/api_service.dart';
import 'package:jobsque/features/favorites/presentation/views/model%20view/repos/data/add_to_fav_repo.dart';

class AddToFavRepoImpl implements AddToFavRepo {
  final ApiService apiService;
  final TokenStorage tokenStorage = TokenStorage();

  AddToFavRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ShowAllFavModel>> addToFavRFunc({required int id}) async {
    try {
      final Map<String, dynamic> data = {
        'job_id': id,
      };
      String? bearerToken = await tokenStorage.getToken();

      print('Adding job with ID $id to favorites...');

      final Map<String, dynamic> responseData =
          await apiService.addToFavApiService(
              endPoint: 'favorites', data: data, bearerToken: bearerToken);

      final ShowAllFavModel jobsModel = ShowAllFavModel.fromJson(responseData);
      // ignore: avoid_print
      print('Job with ID $id successfully added to favorites.');

      return Right(jobsModel);
    } catch (e) {
      if (e is DioException) {
        // ignore: avoid_print
        print('Error while adding job with ID $id to favorites: $e');

        return left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
