import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/student%20schedule/presentation/view%20models/get%20appointment/getappointment_cubit.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/appointment_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

class AppointmentsState extends StatelessWidget {
  const AppointmentsState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetappointmentCubit, GetappointmentState>(
      builder: (context, state) {
        if (state is GetappointmentLoading) {
          return const Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is GetappointmentFailure) {
          return Expanded(
            child: Center(
              child: Text(state.errormsg),
            ),
          );
        } else if (state is GetappointmentSuccess) {
          return Expanded(
              child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.myAppointmentModel.userInterview?.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.only(bottom: 16.0, right: 8.0, left: 8.0),
                child: GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => AppointmentDetails(
                        appointment:
                            state.myAppointmentModel.userInterview?[index],
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: mycolor.hcolor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Text(
                              "موعد لدى د. ",
                              style: TextStyle(fontSize: 14),
                            ),
                            Text("روان قرعوني", style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "الحالة : ",
                              style: TextStyle(fontSize: 14),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: mycolor.hcolor,
                                  borderRadius: BorderRadius.circular(15)),
                              height: 60,
                              width: MediaQuery.of(context).size.width * .15,
                              child: Center(
                                child: CircularPercentIndicator(
                                  radius: 24.0, // نصف قطر الدائرة
                                  lineWidth: 6.0, // عرض خط المؤشر
                                  percent: state.myAppointmentModel
                                              .userInterview?[index].state ==
                                          'processing'
                                      ? 0.5
                                      : 1.0, // النسبة المئوية (0.0 إلى 1.0)
                                  center: Text(
                                    state.myAppointmentModel
                                                .userInterview?[index].state ==
                                            'processing'
                                        ? "معالجة"
                                        : 'مثبت',
                                    style: const TextStyle(fontSize: 12.0),
                                  ),
                                  progressColor: state.myAppointmentModel
                                              .userInterview?[index].state ==
                                          'processing'
                                      ? mycolor.tlcolor
                                      : Colors.green, // لون المؤشر
                                  backgroundColor:
                                      mycolor.lcolor, // لون خلفية المؤشر
                                  circularStrokeCap: CircularStrokeCap
                                      .round, // شكل حواف المؤشر
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ));
        }
        return const Expanded(
          child: Center(
            child: Text('لا يوجد بيانات لعرضها'),
          ),
        );
      },
    );
  }
}
