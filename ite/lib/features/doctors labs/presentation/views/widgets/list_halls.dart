import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/get%20halls/get_halls_cubit.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/custom_icon.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/hall_details.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/lab_name.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/maintenanse.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/add_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListHalles extends StatelessWidget {
  const ListHalles({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHallsCubit, GetHallsState>(
      builder: (context, state) {
        if (state is GetHallsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetHallsFailure) {
          return Center(
            child: Text(state.errormsg),
          );
        } else if (state is GetHallsSuccess) {
          return Container(
            height: 140,
            // width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              padding: EdgeInsets.only(right: 10),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.hallsModel.halls?.length,
              itemBuilder: (context, index) {
                return
                    // CustomLab( maintenanse: 'صيانة',);
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              mycolor.hcolor.withOpacity(.5),
                              mycolor.hcolor
                            ]),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomIcon(icon: Icons.laptop_chromebook_rounded),
                            LabName(text: state.hallsModel.halls![index].name!)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      HallDetails(
                                          hall: state.hallsModel.halls![index]),
                                );
                              },
                              child: AddButton(
                                text: 'تفاصيل',
                                height: 30,
                                width: 60,
                                fontsize: 14,
                                color: mycolor.mcolor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      Maintenanse(
                                    name: state.hallsModel.halls![index].name!,
                                  ),
                                );
                              },
                              child: AddButton(
                                text: 'صيانة',
                                height: 30,
                                width: 60,
                                fontsize: 14,
                                color: mycolor.mcolor,
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
        return Container();
      },
    );
  }
}
