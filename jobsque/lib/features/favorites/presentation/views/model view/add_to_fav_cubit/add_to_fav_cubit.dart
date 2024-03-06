import 'package:bloc/bloc.dart';
import 'package:jobsque/core/models/home_models/fav_jobs_model.dart';
import 'package:jobsque/features/favorites/presentation/views/model%20view/repos/data/add_to_fav_repo_impl.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'add_to_fav_state.dart';

class AddToFavCubit extends Cubit<AddToFavState> {
  AddToFavCubit(this.addToFavRepoImpl) : super(AddToFavInitial());
  final AddToFavRepoImpl addToFavRepoImpl;

  Future<void> addToFavCubitFunc({required int id}) async {
    emit(AddToFavLoading());
    final result = await addToFavRepoImpl.addToFavRFunc(id: id);
    result.fold(
      (failure) {
        emit(AddToFavFailure(failure.errMessage));
      },
      (jobsModel) => {
        emit(AddToFavSuccess(jobsModel)),
      },
    );
  }
}
