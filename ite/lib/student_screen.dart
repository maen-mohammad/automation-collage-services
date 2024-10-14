import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/groups/presentation/view%20models/get%20mygroup%20cubit/get_mygroup_cubit.dart';
import 'package:ite/features/groups/presentation/views/groups.dart';
import 'package:ite/features/profiles/presentation/view/pages/profile_page.dart';
import 'package:ite/features/student%20files/presentation/views/doctors.dart';
import 'package:ite/features/student%20schedule/presentation/view%20models/get%20appointment/getappointment_cubit.dart';
import 'package:ite/features/student%20schedule/presentation/view%20models/get%20doctors/getdoctors_cubit.dart';
import 'package:ite/features/student%20schedule/presentation/views/student_appointment.dart';
import 'package:ite/features/student%20transactions/presentation/view%20model/get%20transaction/gettransaction_cubit.dart';
import 'package:ite/features/student%20transactions/presentation/view/student_transactions.dart';
import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  int selectedPage = 0;

  final _pages = [
    ProfilePage(),
    Groups(),
    StudentAppointment(),
    StudentTransactions(),
    Doctors(),
  ];

  @override
  Widget build(BuildContext context) {
    const List<TabItem> items = [
      TabItem(
        icon: FontAwesomeIcons.user,
        title: 'الملف الشخصي',
      ),
      TabItem(
        icon: FontAwesomeIcons.userGroup,
        title: 'الفرق',
      ),
      TabItem(
        icon: FontAwesomeIcons.calendarCheck,
        title: 'المواعيد',
      ),
      TabItem(
        icon: FontAwesomeIcons.paste,
        title: 'المعاملات',
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
                selectedPage = index;
                if (index == 1) {
                  BlocProvider.of<GetMygroupCubit>(context).getgroups();
                } else if (index == 2) {
                  BlocProvider.of<GetappointmentCubit>(context)
                      .getappointment();
                } else if (index == 3) {
                  BlocProvider.of<GettransactionCubit>(context)
                      .gettransaction();
                }else if (index == 4) {
                  BlocProvider.of<GetdoctorsCubit>(context)
                      .getdoctors();
                }
                // switch (index) {
                //   case 0:
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (_) {
                //           return StudentAppointment();
                //         },
                //       ),
                //     );
                //   case 1:
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (_) {
                //           return Appointments();
                //         },
                //       ),
                //     );
                //   case 2:
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (_) {
                //           return ShowLabs();
                //         },
                //       ),
                //     );
                // }
              },
            ),
          ),
        ));
  }
}
