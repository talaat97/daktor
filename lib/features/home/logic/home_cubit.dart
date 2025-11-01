import 'package:bloc/bloc.dart';
import 'package:daktor/core/helper/extentions.dart';
import 'package:daktor/core/networking/api_result.dart';
import 'package:daktor/features/home/data/repos/home_repo.dart' show HomeRepo;
import 'package:daktor/features/home/logic/home_state.dart';

import '../../../core/networking/api_error_handler.dart';
import '../data/models/specializations_response_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.specializationsLoading());

  List<SpecializationsData?>? specializationsList = [];
  List<Doctors?>? doctorsList = [];
  void getSpecializations() async {
    emit(HomeState.specializationsLoading());

    final response = await _homeRepo.getSpecialization();

    response.when(
      success: (specializationsResponseModel) {
        getDoctorsList(specializationsList?.first?.id ?? 1);
        specializationsList =  specializationsResponseModel.specializationDataList;
        emit(HomeState.specializationsSuccess(specializationsList));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }

  void getDoctorsList(int specializationId) {
    List<Doctors?>? doctorsList = getDoctorsListBySpecializationId(
      specializationId,
    );

    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError(ErrorHandler.handle('No doctors found')));
    }
  }

  /// returns the list of doctors based on the specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
