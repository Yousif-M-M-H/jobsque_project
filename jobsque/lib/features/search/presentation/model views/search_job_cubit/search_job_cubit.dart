import 'package:bloc/bloc.dart';
import 'package:jobsque/core/models/home_models/all_jobs_model.dart';
import 'package:jobsque/features/search/data/repos/filter_job_repo_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'search_job_state.dart';

class SearchJobCubit extends Cubit<SearchJobState> {
  final SearchJobRepoImpl searchJobRepo;

  SearchJobCubit(this.searchJobRepo) : super(SearchJobInitial());

  Future<void> searchJob(
      {required String name,
      required String location,
      required int salary}) async {
    emit(SearchJobLoading());
    final result = await searchJobRepo.searchJob(
      name: name,
      location: location,
      salary: salary,
    );
    result.fold(
      (failure) => emit(SearchJobFailure(failure.errMessage)),
      (jobsModel) => emit(SearchJobSuccess(jobsModel)),
    );
  }
}
