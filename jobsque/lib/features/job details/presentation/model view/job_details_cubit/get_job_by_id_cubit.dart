import 'package:bloc/bloc.dart';
import 'package:jobsque/core/models/home_models/job_id_model.dart';
import 'package:jobsque/features/job%20details/data/repos/get_job_by_id_rep.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'get_job_by_id_state.dart';

class GetJobByIdCubit extends Cubit<GetJobByIdState> {
  GetJobByIdCubit(this.getAllJobByIdRepo) : super(GetJobByIdInitial());

  final GetAllJobByIdRepo getAllJobByIdRepo;

  Future<void> getJobByIdFunc({required int id}) async {
    print('Fetching job details for ID: $id'); // <-- Add this print statement
    emit(GetJobByIdLoading());
    var result = await getAllJobByIdRepo.getJobById(id: id);

    result.fold((failure) {
      print(
          'Failed to fetch job details: ${failure.errMessage}'); // <-- Add this print statement
      emit(GetJobByIdFailure(failure.errMessage));
    }, (jobs) {
      print('Successfully fetched job details'); // <-- Add this print statement
      emit(GetJobByIdSuccess(jobs));
    });
  }
}
