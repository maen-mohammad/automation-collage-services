import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/doctors%20labs/presentation/views/Reserve_labs.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/list_halls.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/list_labs.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/list_reserve_labs.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/title_labs.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/add_button.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/custom_divider.dart';
import 'dart:ui' as ui;

class ShowLabs extends StatelessWidget {
  const ShowLabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        // bottomNavigationBar: CustomBottomNavigationBar(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Constant.appbarheight),
          child: CustomAppBar(text: 'القاعات الدراسية'),
        ),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleLabs(text: 'المخابر'),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) {
                                return ReserveLabs(
                                  type: 'lab',
                                );
                              },
                            ),
                          );
                        },
                        child: const AddButton(
                          text: 'اضافة حجز',
                          height: 30,
                          width: 80,
                          fontsize: 14,
                          color: mycolor.lcolor,
                        ),
                      ),
                    )
                  ],
                ),
                CustomDivider(),
                SizedBox(
                  height: 140,
                  child: ListLabs(),
                ),
              ],
            )),
            SliverToBoxAdapter(
                child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleLabs(text: 'المدرجات'),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) {
                                return ReserveLabs(
                                  type: 'hall',
                                );
                              },
                            ),
                          );
                        },
                        child: AddButton(
                          text: 'اضافة حجز',
                          height: 30,
                          width: 80,
                          fontsize: 14,
                          color: mycolor.lcolor,
                        ),
                      ),
                    )
                  ],
                ),
                CustomDivider(),
                SizedBox(
                  height: 140,
                  child: ListHalles(),
                ),
              ],
            )),
            SliverToBoxAdapter(
                child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleLabs(text: 'الحجوزات'),
                  ],
                ),
                CustomDivider(),
                ListReserveLabs(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
