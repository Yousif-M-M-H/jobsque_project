import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/home_models/all_jobs_model.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/core/utils/api_service.dart';
import 'package:jobsque/features/home/data/repos/fetch_all_jobs_repo.dart';

class AllJobsRepoImpl implements AllJobsRepo {
  final ApiService apiService;
  final TokenStorage tokenStorage = TokenStorage();

  AllJobsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AllJobsModel>> fetchAllJobs() async {
    try {
      print('Calling API to fetch all jobs...');

      // Retrieve the token from SharedPreferences
      String? bearerToken = await tokenStorage.getToken();

      final Map<String, dynamic> responseData = await apiService.getJobs(
        endPoint: 'jobs',
        bearerToken: bearerToken, // Use the retrieved token
      );

      print('API call successful.');

      final AllJobsModel allJobsModel = AllJobsModel.fromJson(responseData);

      return Right(allJobsModel);
    } catch (e) {
      print('Error while fetching all jobs: $e');
      return Left(ServerFailure(e.toString()));
    }
  }
}
