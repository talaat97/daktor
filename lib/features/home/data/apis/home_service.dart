import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constant.dart';
import '../models/specializations_response_model.dart';

part 'home_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;
  @GET(ApiConstants.home)
  Future<SpecializationsResponseModel> getSpecialization();
}
