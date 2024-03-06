import 'package:dartz/dartz.dart';
import 'package:jobsque/core/errors/failures.dart';
import 'package:jobsque/core/models/home_models/fav_jobs_model.dart';

abstract class ShowFavRepo {
  Future<Either<Failure, ShowAllFavModel>> showAllFavs();
}
