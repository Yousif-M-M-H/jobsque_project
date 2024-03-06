import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/home_models/job_id_model.dart';

abstract class GetAllJobByIdRepo {
  Future<Either<Failure, JobIdModel>> getJobById({required int id});
}
