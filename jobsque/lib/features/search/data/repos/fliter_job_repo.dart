import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/home_models/all_jobs_model.dart';

abstract class SearchJobRepo {
  Future<Either<Failure, AllJobsModel>> searchJob(
      {required String name, required String location, required int salary});
}
