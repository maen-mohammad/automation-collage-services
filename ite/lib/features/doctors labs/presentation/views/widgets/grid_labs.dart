import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/features/doctors%20labs/data/models/halls_model/hall.dart';
import 'package:ite/features/doctors%20labs/data/models/labs_model/lab.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/get%20available%20place/get_available_place_cubit.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/custom_icon.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/custom_lab.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/hall_details.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/lab_details.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/lab_name.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/reserve_lab.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/add_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GridLabs extends StatelessWidget {
  const GridLabs({
    super.key,
    required this.type,
    required this.start,
    required this.end,
    required this.date,
  });
  final String type;
  final String start;
  final String end;
  final String date;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAvailablePlaceCubit, GetAvailablePlaceState>(
      builder: (context, state) {
        if (state is GetAvailablePlaceLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetAvailablePlaceFailure) {
          return Center(
            child: Text(state.errormsg),
          );
        } else if (state is GetAvailablePlaceSuccess) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20),
              itemCount: type == 'hall'
                  ? state.availablePlace.availableHalls?.length
                  : state.availablePlace.availableLabs?.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
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
                            LabName(
                                text: type == 'hall'
                                    ? state.availablePlace
                                        .availableHalls![index].name!
                                    : state.availablePlace.availableLabs![index]
                                        .name!)
                          ],
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
                                  builder: (BuildContext context) => ReserveLab(
                                    start: start,
                                    end: end,
                                    date: date,
                                    name: type == 'hall'
                                        ? state.availablePlace
                                            .availableHalls![index].name!
                                        : state.availablePlace
                                            .availableLabs![index].name!,
                                  ),
                                );
                              },
                              child: AddButton(
                                text: 'حجز',
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
