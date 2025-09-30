import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class OrSignUpDiver extends StatelessWidget {
  const OrSignUpDiver({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: ColorsManager.gray)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            "OR sign up with ",
            style: TextStyle(color: ColorsManager.gray),
          ),
        ),
        Expanded(child: Divider(thickness: 1, color: ColorsManager.gray)),
      ],
    );
  }
}
