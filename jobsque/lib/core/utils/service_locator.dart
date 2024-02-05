import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jobsque/core/utils/api_service.dart';
import 'package:jobsque/features/home/data/repos/fetch_all_jobs_repo_impl.dart';
import 'package:jobsque/features/login/data/repos/login_user_repo_impl.dart';
import 'package:jobsque/features/search/data/repos/filter_job_repo_impl.dart';
import 'package:jobsque/features/signup/presentation/data/repos/register_repo_impl.dart';

final getit = GetIt.instance;

void setup() {
  getit.registerSingleton<RegisterRepoImpl>(
    RegisterRepoImpl(
      ApiService(
        Dio(),
      ),
    ),
  );

  getit.registerSingleton(
    LoginUserRepoImpl(
      ApiService(
        Dio(),
      ),
    ),
  );
  getit.registerSingleton(
    AllJobsRepoImpl(
      ApiService(
        Dio(),
      ),
    ),
  );
  getit.registerSingleton(
    SearchJobRepoImpl(
      ApiService(
        Dio(),
      ),
    ),
  );
}
