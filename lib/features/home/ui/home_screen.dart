import 'package:daktor/core/helper/spasing.dart';
import 'package:daktor/features/home/data/models/specializations_response_model.dart';
import 'package:daktor/features/home/logic/home_cubit.dart';
import 'package:daktor/features/home/logic/home_state.dart';
import 'package:daktor/features/home/ui/widget/doctors_blue_container.dart';
import 'package:daktor/features/home/ui/widget/doctors_list_view.dart';
import 'package:daktor/features/home/ui/widget/doctors_speciality_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/doctors_speciality_list_view.dart';
import 'widget/home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(24.h),
              const DoctorsSpecialitySeeAll(),
              verticalSpace(18),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (_, current) {
                  return current is SpecializationsSuccess ||
                      current is SpecializationsLoading ||
                      current is SpecializationsError;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    specializationsLoading: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    specializationsSuccess: (specializationsResponseModel) {
                      var specializtionsList =
                          specializationsResponseModel.specializationDataList!;

                      var doctorsList = specializtionsList.first!.doctorsList;
                      return Expanded(
                        child: Column(
                          children: [
                            DoctorsSpecialityListView(
                              specializtionsList: specializtionsList,
                            ),
                            Expanded(
                              child: DoctorsListView(listDoctors: doctorsList),
                            ),
                          ],
                        ),
                      );
                    },

                    specializationsError: (errorHandler) {
                      return Center(
                        child: Text(
                          errorHandler.apiErrorModel.message ??
                              'An error occurred',
                          style: TextStyle(color: Colors.red, fontSize: 16.sp),
                        ),
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
