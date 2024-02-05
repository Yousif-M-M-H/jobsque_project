import 'package:bloc/bloc.dart';
import 'package:jobsque/core/models/home_models/all_jobs_model.dart';
import 'package:jobsque/features/home/data/repos/fetch_all_jobs_repo.dart';
import 'package:meta/meta.dart';

part 'all_jobs_state.dart';

class AllJobsCubit extends Cubit<AllJobsState> {
  AllJobsCubit(this.allJobsRepo) : super(AllJobsInitial());

  final AllJobsRepo allJobsRepo;

  Future<void> getAllJobs() async {
    print('Fetching all jobs...');

    emit(AllJobsLoading());
    var result = await allJobsRepo.fetchAllJobs();

    result.fold((failure) {
      print('Failed to fetch all jobs: ${failure.errMessage}');
      emit(AllJobsFailure(failure.errMessage));
    }, (jobs) {
      print('Successfully fetched all jobs');
      emit(AllJobsSuccess(jobs));
    });
  }
}
