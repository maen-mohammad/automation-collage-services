import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ite/core/utils/colors.dart';
import 'dart:ui' as ui;
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/dactors%20schedule/data/models/my_appointment/doctor_interview.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/get%20notes/getnotes_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/views/notes.dart';
import 'package:ite/features/dactors%20schedule/presentation/views/widgets/addnote.dart';

class AppointmentOfDay extends StatefulWidget {
  const AppointmentOfDay({super.key, required this.appointment});
  final List<DoctorInterview> appointment;
  @override
  State<AppointmentOfDay> createState() => _AppointmentOfDayState();
}

class _AppointmentOfDayState extends State<AppointmentOfDay> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(Constant.appbarheight),
              child: CustomAppBar(text: 'مواعيد اليوم')),
          body: ListView.builder(
            itemCount: widget.appointment.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: Container(
                  // height: 180,
                  decoration: BoxDecoration(
                      color: mycolor.hcolor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            'المجموعة    ${widget.appointment[index].groupId}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .45,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        widget.appointment[index].from!
                                            .substring(0, 5),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      studentname(widget
                                          .appointment[index].group!.student1!),
                                      studentname(widget
                                          .appointment[index].group!.student2!),
                                      studentname(widget
                                          .appointment[index].group!.student3!),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .45,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        widget.appointment[index].to!
                                            .substring(0, 5),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      studentname(widget
                                          .appointment[index].group!.student4!),
                                      studentname(widget
                                          .appointment[index].group!.student5!),
                                      studentname(widget
                                          .appointment[index].group!.student6!),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<GetnotesCubit>(context)
                                    .getnotes({
                                  'group_id': widget.appointment[index].groupId,
                                });
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return const Notes();
                                  },
                                ));
                              },
                              child: const Text('الملاحظات السابقة')),
                          ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(mycolor.tlcolor)),
                              onPressed: () {
                                showCupertinoModalPopup<void>(
                                    context: context,
                                    builder: (BuildContext context) => Addnote(
                                          id: widget.appointment[index].id!,
                                        ));
                              },
                              child: const Text('اضافة ملاحظة')),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }

  Text studentname(String name) {
    return Text(
      name,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}
