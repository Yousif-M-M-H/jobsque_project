import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:jobsque/core/utils/api_service.dart';
import 'package:jobsque/features/favorites/presentation/views/model%20view/repos/data/add_to_fav_repo_impl.dart';
import 'package:jobsque/features/favorites/presentation/views/model%20view/repos/data/show_fav_repo_folder/show_fav_repo_impl.dart';
import 'package:jobsque/features/home/data/repos/fetch_all_jobs_repo_impl.dart';
import 'package:jobsque/features/job%20details/data/repos/get_job_by_id_rep_impl.dart';
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
  getit.registerSingleton(
    GetAllJobByIdRepoImpl(
      ApiService(
        Dio(),
      ),
    ),
  );

  getit.registerSingleton(
    AddToFavRepoImpl(
      ApiService(
        Dio(),
      ),
    ),
  );
  getit.registerSingleton(
    ShowFavRepoImpl(
      ApiService(
        Dio(),
      ),
    ),
  );
}
