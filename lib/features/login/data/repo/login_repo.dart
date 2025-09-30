import 'package:daktor/core/networking/api_error_handler.dart';
import 'package:daktor/core/networking/api_result.dart';
import 'package:daktor/features/login/data/model/login_request_body.dart';
import 'package:daktor/features/login/data/model/login_response.dart';

import '../../../../core/networking/api_service.dart';

class LoginRepo {
  final ApiService apiService;
  LoginRepo(this.apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody loginRequestBody) async{

  try {
    final response = await apiService.login(loginRequestBody);
    return ApiResult.success(response);
  } catch (error) {
    return ApiResult.failure(ErrorHandler.handle(error));
  }

  }
}
