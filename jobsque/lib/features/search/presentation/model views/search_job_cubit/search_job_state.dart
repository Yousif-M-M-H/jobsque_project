part of 'search_job_cubit.dart';

@immutable
sealed class SearchJobState {}

final class SearchJobInitial extends SearchJobState {}

final class SearchJobLoading extends SearchJobState {}

final class SearchJobFailure extends SearchJobState {
  final String errMessage;

  SearchJobFailure(this.errMessage);
}

final class SearchJobSuccess extends SearchJobState {
  final AllJobsModel jobsModel;

  SearchJobSuccess(this.jobsModel);
}
