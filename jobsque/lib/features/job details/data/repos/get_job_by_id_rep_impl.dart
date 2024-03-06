import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/home_models/job_id_model.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/core/utils/api_service.dart';
import 'package:jobsque/features/job%20details/data/repos/get_job_by_id_rep.dart';

class GetAllJobByIdRepoImpl implements GetAllJobByIdRepo {
  final ApiService apiService;
  final TokenStorage tokenStorage = TokenStorage();

  GetAllJobByIdRepoImpl(this.apiService);

  @override
  Future<Either<Failure, JobIdModel>> getJobById({
    required int id,
  }) async {
    try {
      String? bearerToken = await tokenStorage.getToken();

      final Map<String, dynamic> responseData =
          await apiService.getJobByIdApiService(
        endPoint: 'jobs/$id',
        bearerToken: bearerToken,
      );

      print('Response Data: $responseData');

      final JobIdModel allJobsModel = JobIdModel.fromJson(responseData);

      print(
          'Parsed AllJobsModel: $allJobsModel'); // Print the parsed AllJobsModel

      return Right(allJobsModel);
    } catch (e) {
      print('Error occurred: $e'); // Print the error if any
      return Left(ServerFailure(e.toString()));
    }
  }
}
