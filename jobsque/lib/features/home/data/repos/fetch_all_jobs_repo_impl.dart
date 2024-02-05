import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/home_models/all_jobs_model.dart';
import 'package:jobsque/core/utils/api_service.dart';
import 'package:jobsque/features/home/data/repos/fetch_all_jobs_repo.dart';

class AllJobsRepoImpl implements AllJobsRepo {
  final ApiService apiService;

  AllJobsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, AllJobsModel>> fetchAllJobs() async {
    try {
      // Print statement before the API call
      print('Calling API to fetch all jobs...');

      final Map<String, dynamic> responseData = await apiService.getJobs(
        endPoint: 'jobs',
        bearerToken: '2689|uERlFfnpNd7kwK9x2IvpN6Cf9HDU7QK6weBjeY8i',
      );

      // Print statement after the API call
      print('API call successful.');

      final AllJobsModel allJobsModel = AllJobsModel.fromJson(responseData);

      return Right(allJobsModel);
    } catch (e) {
      // Print statement in case of an error
      print('Error while fetching all jobs: $e');
      return Left(ServerFailure(e.toString()));
    }
  }
}
