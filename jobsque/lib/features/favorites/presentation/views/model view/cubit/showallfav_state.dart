part of 'showallfav_cubit.dart';

@immutable
sealed class ShowallfavState {}

final class ShowallfavInitial extends ShowallfavState {}

final class ShowallfavLoading extends ShowallfavState {}

final class ShowallfavSuccess extends ShowallfavState {
  final ShowAllFavModel favorites;

  ShowallfavSuccess(this.favorites);
}

final class ShowallfavFailure extends ShowallfavState {
  final String errMessage;

  ShowallfavFailure(this.errMessage);
}
