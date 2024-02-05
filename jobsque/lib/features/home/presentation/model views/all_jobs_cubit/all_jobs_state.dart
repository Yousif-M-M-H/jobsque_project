part of 'all_jobs_cubit.dart';

@immutable
sealed class AllJobsState {}

final class AllJobsInitial extends AllJobsState {}

final class AllJobsLoading extends AllJobsState {}

final class AllJobsFailure extends AllJobsState {
  final String errMessage;

  AllJobsFailure(this.errMessage);
}

final class AllJobsSuccess extends AllJobsState {
  final AllJobsModel jobs;

  AllJobsSuccess(this.jobs);
}
