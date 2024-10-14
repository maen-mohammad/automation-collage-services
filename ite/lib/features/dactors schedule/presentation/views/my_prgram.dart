import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/dactors%20schedule/data/models/my_program/formal.dart';
import 'package:ite/features/dactors%20schedule/data/models/my_program/my_program.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/get%20program/get_program_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/views/widgets/cancel_progrm.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/add_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPrgram extends StatefulWidget {
  const MyPrgram({super.key});

  @override
  State<MyPrgram> createState() => _MyPrgramState();
}

class _MyPrgramState extends State<MyPrgram> {
  List<Formal>? getLecturesByDay(String day, MyProgram myprogram) {
    List<Formal>? lectures = myprogram.formal;
    return lectures?.where((lecture) => lecture.day == day).toList();
  }

  List<Formal>? program = [];
  List<String> weekDays = [
    "الأحد",
    "الإثنين",
    "الثلاثاء",
    "الأربعاء",
    "الخميس",
  ];
  String? selectedDay = "الأحد";
  bool sday = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(Constant.appbarheight),
          child: CustomAppBar(text: 'برنامح الدوام')),
      body: BlocBuilder<GetProgramCubit, GetProgramState>(
        builder: (context, state) {
          if (state is GetProgramLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetProgramFailure) {
            return Center(
              child: Text(state.errormsg),
            );
          } else if (state is GetProgramSuccess) {
            return Column(
              children: [
                Container(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: weekDays.length,
                    itemBuilder: (context, index) {
                      String day = weekDays[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDay = day;
                            sday = true;
                            program = getLecturesByDay(
                                selectedDay == "الأحد"
                                    ? '1'
                                    : selectedDay == "الإثنين"
                                        ? '2'
                                        : selectedDay == "الثلاثاء"
                                            ? '3'
                                            : selectedDay == "الأربعاء"
                                                ? '4'
                                                : '5',
                                state.myProgram);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            color: selectedDay == day
                                ? mycolor.tlcolor
                                : mycolor.lcolor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              day,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                grid(sday == false
                    ? program = getLecturesByDay('1', state.myProgram)
                    : program),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget grid(List<Formal>? programday) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 4),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 10),
        itemCount: programday?.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              width: 140,
              height: 260,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [mycolor.hcolor.withOpacity(.5), mycolor.hcolor]),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     // CustomIcon(icon: Icons.laptop_chromebook_rounded),
                  //     // LabName(text: programday![index].lecture!),
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: mycolor.mcolor.withOpacity(.5),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          programday![index].lecture!,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'القاعة ${programday[index].place!}',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    '${programday[index].from!.substring(0, 5)}        ${programday[index].to!.substring(0, 5)}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // GestureDetector(
                      //   onTap: () {
                      //     showCupertinoModalPopup<void>(
                      //       context: context,
                      //       builder: (BuildContext context) => type ==
                      //               'hall'
                      //           ? HallDetails(
                      //               hall: state.availablePlace
                      //                   .availableHalls![index] as Hall)
                      //           : LabDetails(
                      //               lab: state.availablePlace
                      //                   .availableLabs![index] as Lab,
                      //             ),
                      //     );
                      //   },
                      //   child: AddButton(
                      //     text: 'تفاصيل',
                      //     height: 30,
                      //     width: 60,
                      //     fontsize: 14,
                      //     color: mycolor.mcolor,
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup<void>(
                              context: context,
                              builder: (BuildContext context) => CancelProgrm(
                                    id: '1',
                                  ));
                        },
                        child: AddButton(
                          text: 'اعتذار',
                          height: 35,
                          width: 80,
                          fontsize: 14,
                          color: mycolor.lcolor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
