import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/get%20reserves/get_reserves_cubit.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/lab_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:intl/intl.dart';

class ListReserveLabs extends StatelessWidget {
  const ListReserveLabs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReservesCubit, GetReservesState>(
      builder: (context, state) {
        if (state is GetReservesLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetReservesFailure) {
          return Center(
            child: Text(state.errormsg),
          );
        } else if (state is GetReservesSuccess) {
          return ListView.builder(
            itemCount: state.myReserves.doctorReserve?.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      height: 60,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              mycolor.hcolor.withOpacity(.5),
                              mycolor.hcolor,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LabName(
                              text: state
                                  .myReserves.doctorReserve![index].place!),
                          Row(
                            children: [
                              Text(
                                DateFormat.MMMEd('ar').format(DateTime.parse(
                                    state.myReserves.doctorReserve![index]
                                        .date!)),
                              ),
                            ],
                          ),
                          Text(
                              'الساعة : ${state.myReserves.doctorReserve![index].from!.substring(0, 5)}'
                              // '${TimeOfDay.now().minute.toString()} : ${TimeOfDay.now().hourOfPeriod.toString()}'
                              ),
                        ],
                      ),
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
                          percent:
                              state.myReserves.doctorReserve![index].state ==
                                      'processing'
                                  ? 0.5
                                  : 1.0, // النسبة المئوية (0.0 إلى 1.0)
                          center: Text(
                            state.myReserves.doctorReserve![index].state ==
                                    'processing'
                                ? "معالجة"
                                : 'مثبت',
                            style: TextStyle(fontSize: 12.0),
                          ),
                          progressColor:
                              state.myReserves.doctorReserve![index].state ==
                                      'processing'
                                  ? mycolor.tlcolor
                                  : Colors.green, // لون المؤشر
                          backgroundColor: mycolor.lcolor, // لون خلفية المؤشر
                          circularStrokeCap:
                              CircularStrokeCap.round, // شكل حواف المؤشر
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     showCupertinoModalPopup<void>(
                    //       context: context,
                    //       builder: (BuildContext context) =>
                    //           const CancelReseve(),
                    //     );
                    //   },
                    //   child: AddButton(
                    //       text: 'الغاء',
                    //       height: 50,
                    //       width: MediaQuery.of(context).size.width * .15,
                    //       fontsize: 16,
                    //       color: mycolor.lcolor),
                    // ),
                  ],
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
