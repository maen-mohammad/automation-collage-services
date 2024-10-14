import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/get%20my%20appointment/get_my_appointment_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/view%20models/get%20program/get_program_cubit.dart';
import 'package:ite/features/dactors%20schedule/presentation/views/appointments.dart';
import 'package:ite/features/dactors%20schedule/presentation/views/my_prgram.dart';
import 'package:ite/features/doctor%20files/presentation/view%20model/get%20myfile/get_myfile_cubit.dart';
import 'package:ite/features/doctor%20files/presentation/views/my_files.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/get%20halls/get_halls_cubit.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/get%20labs/get_labs_cubit.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/get%20reserves/get_reserves_cubit.dart';
import 'dart:ui' as ui;

import 'package:ite/features/doctors%20labs/presentation/views/show_labs.dart';
import 'package:ite/features/profiles/presentation/view/pages/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DoctorScreen extends StatefulWidget {
  DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  int selectedPage = 0;

  final _pages = [
    ProfilePage(),
    Appointments(),
    ShowLabs(),
    MyPrgram(),
    MyFiles(),
  ];

  @override
  Widget build(BuildContext context) {
    const List<TabItem> items = [
      TabItem(
        icon: FontAwesomeIcons.user,
        title: 'الملف الشخصي',
      ),
      TabItem(
        icon: FontAwesomeIcons.calendarCheck,
        title: 'المواعيد',
      ),
      TabItem(
        icon: FontAwesomeIcons.houseLaptop,
        title: 'القاعات',
      ),
      TabItem(
        icon: FontAwesomeIcons.table,
        title: 'البرنامج',
      ),
      TabItem(
        icon: FontAwesomeIcons.file,
        title: 'الملفات',
      ),
    ];
    return Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Scaffold(
          body: _pages[selectedPage],
          bottomNavigationBar: BottomBarDefault(
            items: items,
            backgroundColor: mycolor.mcolor,
            color: Colors.white,
            colorSelected: mycolor.lcolor,
            indexSelected: selectedPage,
            paddingVertical: 18,
            onTap: (index) => setState(
              () {
                if (index == 1) {
                  BlocProvider.of<GetMyAppointmentCubit>(context)
                      .getappointment();
                } else if (index == 2) {
                  BlocProvider.of<GetHallsCubit>(context).gethalls();
                  BlocProvider.of<GetLabsCubit>(context).getlabs();
                  BlocProvider.of<GetReservesCubit>(context).getreserves();
                } else if (index == 3) {
                  BlocProvider.of<GetProgramCubit>(context).getprogram();
                } else if (index == 4) {
                  BlocProvider.of<GetMyfileCubit>(context).getfile();
                }
                selectedPage = index;
              },
            ),
          ),
        ));
  }
}
