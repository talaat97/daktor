import 'package:daktor/core/networking/api_error_handler.dart';
import 'package:daktor/core/networking/api_result.dart';

import 'package:daktor/features/sign_up/data/model/sign_up_request_body.dart';
import 'package:daktor/features/sign_up/data/model/sign_up_response.dart';

import '../../../../core/networking/api_service.dart';

class SignUpRepo {
  final ApiService apiService;
  SignUpRepo(this.apiService);

  Future<ApiResult<SignupResponse>> signUp(
    SignupRequestBody signUpRequestBody,
  ) async {
    try {
      final response = await apiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
