import 'package:bloc/bloc.dart';
import 'package:jobsque/core/models/home_models/fav_jobs_model.dart';
import 'package:jobsque/features/favorites/presentation/views/model%20view/repos/data/show_fav_repo_folder/show_fav_repo_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'showallfav_state.dart';

class ShowallfavCubit extends Cubit<ShowallfavState> {
  ShowallfavCubit(this.showFavRepoImpl) : super(ShowallfavInitial());
  final ShowFavRepoImpl showFavRepoImpl;

  Future<void> showAllFavCubitFunc() async {
    emit(ShowallfavLoading());
    final result = await showFavRepoImpl.showAllFavs();
    result.fold(
      (failure) {
        emit(ShowallfavFailure(failure.errMessage));
      },
      (favs) => {
        emit(ShowallfavSuccess(favs)),
      },
    );
  }
}
