import 'package:daktor/features/onboarding/widgets/doctor_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/material_button_app.dart';
import 'widgets/doctor_and_name.dart';
import 'widgets/header_title.dart';
import 'widgets/supp_title.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 15.h,
            vertical: 30.h,
          ),
          child: Column(
            children: [
              DoctorAndName(),
              DoctorImage(),
              HeaderTitle(),
              SizedBox(height: 10.h),
              SuppTitle(),
              SizedBox(height: 20.h),
              MaterialButtonApp(),
            ],
          ),
        ),
      ),
    );
  }
}
