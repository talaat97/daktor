  import 'package:daktor/core/networking/api_constant.dart';
  import 'package:dio/dio.dart';

  import 'package:retrofit/retrofit.dart';

  import '../../features/login/data/model/login_request_body.dart';
  import '../../features/login/data/model/login_response.dart';
  import '../../features/sign_up/data/model/sign_up_request_body.dart';
  import '../../features/sign_up/data/model/sign_up_response.dart';

  part 'api_service.g.dart';

  @RestApi(baseUrl: ApiConstants.baseUrl)
  abstract class ApiService {
    factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

    @POST(ApiConstants.login)
    Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

    @POST(ApiConstants.signUp)
    Future<SignupResponse> signUp(@Body() SignupRequestBody signUpRequestBody);
  }
