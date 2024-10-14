import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/student%20files/presentation/view%20model/get%20files/getfiles_cubit.dart';
import 'package:ite/features/student%20files/presentation/views/files.dart';
import 'package:ite/features/student%20schedule/presentation/view%20models/get%20doctors/getdoctors_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Doctors extends StatelessWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(Constant.appbarheight),
            child: CustomAppBar(
              text: 'الدكاترة',
            ),
          ),
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: BlocBuilder<GetdoctorsCubit, GetdoctorsState>(
                builder: (context, state) {
                  if (state is GetdoctorsLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GetdoctorsFailure) {
                    return Center(
                      child: Text(state.errormsg),
                    );
                  } else if (state is GetdoctorsSuccess) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(4),
                      itemCount: state.doctors.doctors?.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            BlocProvider.of<GetfilesCubit>(context).getfiles({
                              'doctor_id': state.doctors.doctors?[index].id
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return Files();
                              },
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: mycolor.hcolor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              height: 80,
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 8),
                                    height: 60,
                                    width: 60,
                                    child: ClipOval(
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        color: mycolor.Thcolor,
                                        child: const Icon(
                                          FontAwesomeIcons.userGraduate,
                                          color: mycolor.lcolor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Text(
                                      'الدكتور ${state.doctors.doctors?[index].name}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                  // ClipRRect(
                                  //   borderRadius: BorderRadius.circular(50),
                                  //   child: Icon(FontAwesomeIcons.a),
                                  // )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              )),
        ));
  }
}
