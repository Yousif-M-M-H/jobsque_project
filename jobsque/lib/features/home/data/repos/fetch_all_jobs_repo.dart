import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/home_models/all_jobs_model.dart';

abstract class AllJobsRepo {
  Future<Either<Failure, AllJobsModel>> fetchAllJobs();
}
