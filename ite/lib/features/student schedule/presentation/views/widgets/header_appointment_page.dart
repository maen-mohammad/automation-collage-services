import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/student%20schedule/presentation/view%20models/get%20doctors/getdoctors_cubit.dart';
import 'package:ite/features/student%20schedule/presentation/views/add_appointment.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/add_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderApointmentPage extends StatelessWidget {
  const HeaderApointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, right: 16, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "المواعيد المحجوزة",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
              onTap: () {
                BlocProvider.of<GetdoctorsCubit>(context).getdoctors();
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) {
                      return AddAppointment();
                    },
                  ),
                );
              },
              child: AddButton(
                text: 'اضافة موعد',
                height: 40,
                width: MediaQuery.of(context).size.width * 0.3,
                fontsize: 18,
                color: mycolor.lcolor,
              ))
        ],
      ),
    );
  }
}
