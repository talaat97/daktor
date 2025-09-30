import 'package:daktor/core/networking/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/cubit/login_cubit.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../networking/api_service.dart';

final getIt = GetIt.instance;

Future setupGetIt() async {
  //Dio % ApiService

  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
}
