import 'package:daktor/core/di/dependeancy_injection.dart';
import 'package:daktor/doc_app.dart';
import 'package:flutter/material.dart';

import 'core/routing/app_router.dart';

void main() {
  setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}
