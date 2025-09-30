import 'package:bloc/bloc.dart';
import 'package:daktor/core/networking/api_result.dart';
import 'package:daktor/features/login/cubit/login_state.dart';
import 'package:daktor/features/login/data/model/login_request_body.dart';
import 'package:daktor/features/login/data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginState.initial());

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(LoginState.loading());

    final response = await loginRepo.login(loginRequestBody);

    response.when(
      success: (data) {
        emit(LoginState.success(data));
      },
      failure: (error) {
        emit(LoginState.error(message: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
