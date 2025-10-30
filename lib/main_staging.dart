import 'package:daktor/core/di/dependeancy_injection.dart';
import 'package:daktor/core/helper/constatnt.dart';
import 'package:daktor/core/helper/extentions.dart';
import 'package:daktor/core/helper/shared_pref_helper.dart';
import 'package:daktor/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();

  //to fix the text being bug in flutter_screenutil package in release mode
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DocApp(appRouter: AppRouter()));
}

checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
