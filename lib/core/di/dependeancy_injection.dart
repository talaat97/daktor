import 'package:daktor/core/networking/dio_factory.dart';
import 'package:daktor/features/home/data/apis/home_service.dart';
import 'package:daktor/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repos/home_repo.dart';
import '../../features/login/cubit/login_cubit.dart';
import '../../features/login/data/repo/login_repo.dart';
import '../../features/sign_up/cubit/sign_up_cubit.dart';
import '../networking/api_service.dart';

final getIt = GetIt.instance;

Future setupGetIt() async {
  //Dio % ApiService

  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  //SignUp
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
  //Home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
