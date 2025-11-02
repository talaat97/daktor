import 'package:bloc/bloc.dart';
import 'package:daktor/core/helper/shared_pref_helper.dart';
import 'package:daktor/core/networking/api_result.dart';
import 'package:daktor/features/login/cubit/login_state.dart';
import 'package:daktor/features/login/data/model/login_request_body.dart';
import 'package:daktor/features/login/data/repo/login_repo.dart';
import 'package:flutter/widgets.dart';

import '../../../core/helper/constatnt.dart';
import '../../../core/networking/dio_factory.dart' show DioFactory;

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(LoginState.loading());

    final response = await loginRepo.login(loginRequestBody);

    response.when(
      success: (loginResponse) async {
        emit(LoginState.success(loginResponse));
        await saveToken(loginResponse.userData!.token ?? 'none');
      },
      failure: (error) {
        emit(LoginState.error(message: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

Future<void> saveToken(String token) async {
  await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  DioFactory.refreshTokenHeader(token);
}
