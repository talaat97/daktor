import 'package:daktor/core/helper/extentions.dart';
import 'package:flutter/material.dart';

import '../routing/routes.dart';
import '../theming/colors.dart';
import '../theming/stryle.dart';

class MaterialButtonApp extends StatelessWidget {
  const MaterialButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorsManager.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStateProperty.all(Size(double.infinity, 52)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
      ),

      child: Text('Get started', style: TextStyles.font16WhiteSemiBold),
    );
  }
}
