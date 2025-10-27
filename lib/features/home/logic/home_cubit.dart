import 'package:bloc/bloc.dart';
import 'package:daktor/core/networking/api_result.dart';
import 'package:daktor/features/home/data/repos/home_repo.dart' show HomeRepo;
import 'package:daktor/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.specializationsLoading());

  void getSpecializations() async {
    emit(HomeState.specializationsLoading());

    final response = await _homeRepo.getSpecialization();

    response.when(
      success: (specializationsResponseModel) {
        emit(HomeState.specializationsSuccess(specializationsResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }
}
