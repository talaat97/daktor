import 'package:daktor/core/theming/stryle.dart';
import 'package:flutter/widgets.dart';

class SuppTitle extends StatelessWidget {
  const SuppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Text(
        'Manage and schedule all of your medical appointments easily\n with Docdoc to get a new experience.',
        textAlign: TextAlign.center,
        style: TextStyles.font14GrayRegular,
      ),
    );
  }
}
