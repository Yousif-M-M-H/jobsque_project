part of 'get_job_by_id_cubit.dart';

@immutable
sealed class GetJobByIdState {}

final class GetJobByIdInitial extends GetJobByIdState {}

final class GetJobByIdLoading extends GetJobByIdState {}

final class GetJobByIdSuccess extends GetJobByIdState {
  final JobIdModel jobs;

  GetJobByIdSuccess(this.jobs);
}

final class GetJobByIdFailure extends GetJobByIdState {
  final String errMessage;

  GetJobByIdFailure(this.errMessage);
}
