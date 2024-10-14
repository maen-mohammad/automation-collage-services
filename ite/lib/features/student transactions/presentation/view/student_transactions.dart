import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/title_labs.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/custom_divider.dart';
import 'package:ite/features/student%20transactions/presentation/view/widgets/list_transaction.dart';
import 'package:ite/features/student%20transactions/presentation/view/widgets/list_transaction_ordered.dart';

class StudentTransactions extends StatelessWidget {
  const StudentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Constant.appbarheight),
          child: CustomAppBar(text: 'معاملاتي'),
        ),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  TitleLabs(text: 'اضافة معاملة'),
                  CustomDivider(),
                  ListTransactionsTypes(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TitleLabs(text: 'الطلبات السابقة'),
                  CustomDivider(),
                  ListTransactionOrdered(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
