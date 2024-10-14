import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:ui' as ui;

class AllAppointment extends StatefulWidget {
  const AllAppointment({super.key});

  @override
  State<AllAppointment> createState() => _AllAppointmentState();
}

class _AllAppointmentState extends State<AllAppointment> {
  Map<String, double> dataMap = {
    "المواعيد المنجزة": 5,
    "المواعيد المرفوضة": 3,
    "المواعيد الغير منجزة": 2,
  };
  List<Color> colorList = [mycolor.mcolor, mycolor.lcolor, mycolor.hcolor];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(Constant.appbarheight),
            child: CustomAppBar(text: 'جميع المواعيد')),
        body: PieChart(
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 2000),
          chartLegendSpacing: 32,
          chartRadius: MediaQuery.of(context).size.width / 1.5,
          colorList: colorList,
          initialAngleInDegree: 0,
          chartType: ChartType.ring,
          ringStrokeWidth: 32,
          centerText: "98",
          legendOptions: LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.bottom,
            showLegends: true,
            legendShape: BoxShape.circle,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: ChartValuesOptions(
            showChartValueBackground: false,
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValuesOutside: false,
            decimalPlaces: 1,
          ),
          // gradientList: ---To add gradient colors---
          // emptyColorGradient: ---Empty Color gradient---
        ),
      ),
    );
  }
}
