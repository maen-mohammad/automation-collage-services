import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/failurmsg.dart';
import 'package:ite/core/utils/loadingresponse.dart';
import 'package:ite/features/dactors%20schedule/data/models/my_appointment/doctor_interview.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/control%20appointment/controlappointment_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/get%20my%20appointment/get_my_appointment_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/views/widgets/custom_dialog.dart';

class CustomListDates extends StatelessWidget {
  const CustomListDates({super.key, required this.appointments});
  final List<DoctorInterview> appointments;

  // void showAlertDialog(BuildContext context) {
  //   showCupertinoModalPopup<void>(
  //     context: context,
  //     builder: (BuildContext context) => const CustomDialog(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 60,
                    decoration: BoxDecoration(
                      color: mycolor.Thcolor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(appointments[index].group!.student1!),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(appointments[index]
                                .from!
                                .toString()
                                .substring(0, 5)),
                            Text(appointments[index]
                                .to!
                                .toString()
                                .substring(0, 5)),
                          ],
                        ),
                        Text(appointments[index].goal!),
                      ],
                    ),
                  ),
                  onTap: () {
                    showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                        appointment: appointments[index],
                      ),
                    );
                  },
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<ControlappointmentCubit>(context)
                        .controlappointment({
                      'interview_id': appointments[index].id,
                      'state': 'accept'
                    });
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: 200,
                          child: BlocBuilder<ControlappointmentCubit,
                              ControlappointmentState>(
                            builder: (context, state) {
                              if (state is ControlappointmentLoading) {
                                return const Loadingresponse();
                              } else if (state is ControlappointmentFailure) {
                                return Failurmsg(msg: state.errormsg);
                              } else if (state is ControlappointmentSuccess) {
                             BlocProvider.of<GetMyAppointmentCubit>(context)
                                    .getappointment();
                                return Center(
                                  child: Text(state.msg),
                                );
                              }
                              return Container();
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * .12,
                    decoration: BoxDecoration(
                        color: mycolor.lcolor,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Icon(
                      FontAwesomeIcons.check,
                      size: 20,
                      color: mycolor.Thcolor,
                    ),
                  ),
                ),
                // : Container(
                //     height: 50,
                //     width: MediaQuery.of(context).size.width * .15,
                //     decoration: BoxDecoration(
                //         color: mycolor.lcolor,
                //         borderRadius: BorderRadius.circular(16)),
                //     child: Center(
                //       child: Text(
                //         downloadProgress,
                //         style: const TextStyle(
                //           color: mycolor.Thcolor,
                //         ),
                //       ),
                //     ),
                //   ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<ControlappointmentCubit>(context)
                        .controlappointment({
                      'interview_id': appointments[index].id,
                      'state': 'reject'
                    });
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: 200,
                          child: BlocBuilder<ControlappointmentCubit,
                              ControlappointmentState>(
                            builder: (context, state) {
                              if (state is ControlappointmentLoading) {
                                return const Loadingresponse();
                              } else if (state is ControlappointmentFailure) {
                                return Failurmsg(msg: state.errormsg);
                              } else if (state is ControlappointmentSuccess) {
                                BlocProvider.of<GetMyAppointmentCubit>(context)
                                    .getappointment();
                                return Center(
                                  child: Text(state.msg),
                                );
                              }
                              return Container();
                            },
                          ),
                        ),
                      ),
                    );
                  }
                  // {
                  //      Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) {
                  //     return DownloadFileExample();
                  //   },
                  // ));
                  // }
                  ,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * .12,
                    decoration: BoxDecoration(
                        color: mycolor.tlcolor,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Icon(
                      FontAwesomeIcons.trash,
                      size: 20,
                      color: mycolor.Thcolor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
