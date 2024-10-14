import 'package:flutter/material.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/appointment_state.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/custom_divider.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/header_appointment_page.dart';

class StudentAppointment extends StatelessWidget {
  const StudentAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // bottomNavigationBar: CustomBottomNavigationBar(),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(Constant.appbarheight),
            child: CustomAppBar(text: "برنامج المواعيد")),
        body: Column(
          children: [
            HeaderApointmentPage(),
            CustomDivider(),
            AppointmentsState(),
          ],
        ),
      ),
    );
  }
}
