import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/home_models/all_jobs_model.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/core/utils/api_service.dart';
import 'package:jobsque/features/search/data/repos/fliter_job_repo.dart';

class SearchJobRepoImpl implements SearchJobRepo {
  final ApiService apiService;
  final TokenStorage tokenStorage = TokenStorage();

  SearchJobRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AllJobsModel>> searchJob(
      {required String name,
      required String location,
      required int salary}) async {
    try {
      final Map<String, dynamic> data = {
        'name': name,
        'location': location,
        'salary': salary,
      };
      String? bearerToken = await tokenStorage.getToken();

      final Map<String, dynamic> responseData =
          await apiService.searchJobsApiService(
              endPoint: 'jobs/filter', data: data, bearerToken: bearerToken);

      final AllJobsModel jobsModel = AllJobsModel.fromJson(responseData);

      return Right(jobsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
