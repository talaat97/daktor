import 'package:daktor/core/theming/stryle.dart';
import 'package:flutter/widgets.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Best Doctor \n Appointment App',
      textAlign: TextAlign.center,
      style: TextStyles.font32BlueBold.copyWith(height: 1.4),
    );
  }
}
