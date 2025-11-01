import 'package:daktor/core/helper/spasing.dart'
    show horizontalSpace, verticalSpace;
import 'package:daktor/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/style.dart';

class DoctorsListView extends StatelessWidget {
  final List<Doctors?>? listDoctors;
  const DoctorsListView({super.key, required this.listDoctors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listDoctors!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  width: 110.w,
                  height: 120.h,
                  'https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050',
                  fit: BoxFit.cover,
                ),
              ),
              horizontalSpace(5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listDoctors![index]!.name ?? '',
                      style: TextStyles.font18DarkBlueBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(5),
                    Text(
                      '${listDoctors![index]!.degree} | ${listDoctors![index]!.phone ?? ''}',
                      //'Degree | 0111111111111',
                      style: TextStyles.font12GrayMedium,
                    ),
                    verticalSpace(5),
                    Text(
                      '${listDoctors![index]!.email}',
                      style: TextStyles.font12GrayMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
