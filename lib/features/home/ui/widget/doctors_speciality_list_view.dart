import 'package:daktor/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helper/spasing.dart';

import '../../../../core/theming/style.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationsList;
  const DoctorsSpecialityListView({
    super.key,
    required this.specializationsList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                CircleAvatar(
                  foregroundColor: Colors.red,
                  radius: 28,
                  // backgroundColor: ColorsManager.lightBlue,
                  child: Text("${specializationsList[index]?.id}"),
                ),
                verticalSpace(8),
                Text(
                  "${specializationsList[index]?.name}",
                  style: TextStyles.font12DarkBlueRegular,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
