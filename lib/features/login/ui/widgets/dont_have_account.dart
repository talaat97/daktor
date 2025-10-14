import 'package:flutter/material.dart';

import '../../../../core/helper/extentions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/style.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushReplacementNamed(Routes.signupScreen);
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have account ?',
              style: TextStyles.font13DarkBlueRegular,
            ),

            TextSpan(text: ' Sign Up', style: TextStyles.font13BlueSemiBold),
          ],
        ),
      ),
    );
  }
}
