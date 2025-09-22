import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DoctorImage extends StatelessWidget {
  const DoctorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.2,
          child: Container(
            alignment: Alignment(1.h, 0),
            child: SvgPicture.asset(
              'assets/svgs/background_logo_onboarding.svg',
            ),
          ),
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0.0)],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              stops: [0.14, 0.4],
            ),
          ),
          child: Image.asset('assets/images/Image.png'),
        ),
      ],
    );
  }
}
