import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/core/utils/failurmsg.dart';
import 'package:ite/core/utils/loadingresponse.dart';
import 'package:ite/core/utils/static_variable.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/control%20all%20appointment/controlallappointment_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/get%20my%20appointment/get_my_appointment_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/views/all_appointment.dart';
import 'package:ite/features/dactors%20schedule/presentation/views/notes.dart';
import 'package:ite/features/dactors%20schedule/presentation/views/widgets/custom_list_dates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ite/core/utils/functions.dart';
import 'package:ite/features/dactors%20schedule/data/models/my_appointment/doctor_interview.dart';
import 'package:ite/features/dactors%20schedule/data/models/my_appointment/my_appointment.dart';
import 'package:ite/features/dactors%20schedule/presentation/views/appointment_of_day.dart';
import 'package:table_calendar/table_calendar.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  List<DateTime>? toHighlight(MyAppointment appointment) {
    return appointment.doctorInterview
        ?.map((interview) => DateTime.parse(interview.date!))
        .toList();
    // List.generate(
    //   10,
    //   (index) {
    //     return DateTime.now().add(Duration(days: index));
    //   },
    // );
  }

  // List<String>? date;
  // void daysappointments(MyAppointment appointment) {
  //   for (int i = 0; i < appointment.doctorInterview!.length; i++) {
  //     if(appointment.doctorInterview?[i].date.toString()  date );
  //   }
  // }
  String? dateday;

  List<DoctorInterview> dayappointment = [];
  void getappointmentday(String date, MyAppointment myappointment, int day) {
    List<DoctorInterview>? appointment = myappointment.doctorInterview;
    setState(() {
      if (day == 0) {
        StaticVariable.appointments = appointment!
            .where((appointment) =>
                appointment.date == date && appointment.state == 'reserve')
            .toList();
        dateday = date;
        print(dateday);
      } else {
        dayappointment = appointment!
            .where((appointment) => appointment.date == date)
            .toList();
      }
    });

    // print(StaticVariable.appointments.toString());
  }

  int getAppointmentsCountForDay(
      List<DoctorInterview> interviews, DateTime day) {
    return interviews.where((interview) {
      // تحويل الحقل date إلى كائن DateTime للمقارنة
      DateTime interviewDate = DateTime.parse(interview.date!);

      // مقارنة اليوم والشهر والسنة فقط بدون الوقت
      return interviewDate.year == day.year &&
          interviewDate.month == day.month &&
          interviewDate.day == day.day;
    }).length;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // bottomNavigationBar: CustomBottomNavigationBar(),
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(Constant.appbarheight),
            child: CustomAppBar(text: "برنامج المواعيد")),
        body: BlocBuilder<GetMyAppointmentCubit, GetMyAppointmentState>(
          builder: (context, state) {
            if (state is GetMyAppointmentloading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetMyAppointmentfailure) {
              return Center(
                child: Text(state.errormsg),
              );
            } else if (state is GetMyAppointmentsuccess) {
              return SlidingUpPanel(
                renderPanelSheet: false,
                panel: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: mycolor.hcolor.withBlue(155).withOpacity(0.8),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: () {
                                if (StaticVariable.appointments.isNotEmpty) {
                                  BlocProvider.of<ControlallappointmentCubit>(
                                          context)
                                      .controlappointment(
                                          {'date': dateday, 'state': 'accept'});
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: SizedBox(
                                        height: 200,
                                        child: BlocBuilder<
                                            ControlallappointmentCubit,
                                            ControlallappointmentState>(
                                          builder: (context, state) {
                                            if (state
                                                is ControlallappointmentLoading) {
                                              return const Loadingresponse();
                                            } else if (state
                                                is ControlallappointmentFailutr) {
                                              return Failurmsg(
                                                  msg: state.errormsg);
                                            } else if (state
                                                is ControlallappointmentSuccess) {
                                              BlocProvider.of<
                                                          GetMyAppointmentCubit>(
                                                      context)
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
                              },
                              child: cbutton(mycolor.lcolor, 'قبول الجميع')),
                          InkWell(
                              onTap: () {
                                if (StaticVariable.appointments.isNotEmpty) {
                                  BlocProvider.of<ControlallappointmentCubit>(
                                          context)
                                      .controlappointment(
                                          {'date': dateday, 'state': 'reject'});
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: SizedBox(
                                        height: 200,
                                        child: BlocBuilder<
                                            ControlallappointmentCubit,
                                            ControlallappointmentState>(
                                          builder: (context, state) {
                                            if (state
                                                is ControlallappointmentLoading) {
                                              return const Loadingresponse();
                                            } else if (state
                                                is ControlallappointmentFailutr) {
                                              return Failurmsg(
                                                  msg: state.errormsg);
                                            } else if (state
                                                is ControlallappointmentSuccess) {
                                              BlocProvider.of<
                                                          GetMyAppointmentCubit>(
                                                      context)
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
                              },
                              child: cbutton(mycolor.tlcolor, 'رفض الجميع'))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomListDates(
                        appointments: StaticVariable.appointments,
                      ),
                    ],
                  ),
                ),

                controller: StaticVariable.panelController,
                minHeight: 0,
                //  defaultPanelStat: PanelState.,
                body: Column(
                  children: [
                    TableCalendar(
                      locale: 'ar',
                      startingDayOfWeek: StartingDayOfWeek.saturday,
                      onDaySelected: (selectedDay, focusedDay) {
                        if (selectedDay.day == DateTime.now().day) {
                          getappointmentday(
                              '${selectedDay.year}-${selectedDay.month.toString().padLeft(2, '0')}-${selectedDay.day.toString().padLeft(2, '0')}',
                              state.myAppointment,
                              1);
                          Navigator.of(context)
                              .push(MaterialPageRoute<void>(builder: (_) {
                            return AppointmentOfDay(
                              appointment: dayappointment,
                            );
                          }));
                        } else {
                          getappointmentday(
                              '${selectedDay.year}-${selectedDay.month.toString().padLeft(2, '0')}-${selectedDay.day.toString().padLeft(2, '0')}',
                              state.myAppointment,
                              0);

                          StaticVariable.panelController.open();
                        }
                      },
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          for (DateTime d
                              in toHighlight(state.myAppointment)!) {
                            if (day.day == d.day &&
                                day.month == d.month &&
                                day.year == d.year) {
                              return Stack(children: [
                                Container(
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    color: mycolor.hcolor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      day.day.toString(),
                                      // Functions.convertToArabicNumbers(
                                      //     day.day.toString()),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: ClipOval(
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      color:
                                          const Color.fromARGB(255, 33, 0, 70),
                                      child: Text(
                                        getAppointmentsCountForDay(
                                                state.myAppointment
                                                    .doctorInterview!,
                                                day)
                                            .toString(),
                                        // Functions.convertToArabicNumbers('99'),
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              ]);
                            }
                          }
                          return null;
                        },
                      ),
                      headerStyle: const HeaderStyle(
                          formatButtonVisible: false, titleCentered: true),
                      firstDay: DateTime.now(),
                      lastDay: DateTime.now().add(const Duration(days: 100)),
                      focusedDay: DateTime.now(),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: ElevatedButton(
                                onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                        builder: (_) {
                                          return const Notes();
                                        },
                                      ),
                                    ),
                                child: const Text('الملاحظات السابقة'))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: ElevatedButton(
                                onPressed: () => Navigator.of(context).push(
                                      MaterialPageRoute<void>(
                                        builder: (_) {
                                          return const AllAppointment();
                                        },
                                      ),
                                    ),
                                child: const Text('احصاء المواعيد')))
                      ],
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget cbutton(Color color, String text) {
    return Container(
      width: 100,
      height: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
