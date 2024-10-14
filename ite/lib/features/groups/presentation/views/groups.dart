import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:ite/core/utils/colors.dart';
import 'dart:ui' as ui;

import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/core/utils/text_styles.dart';
// import 'package:ite/features/groups/presentation/views/widget/group_grid.dart';
import 'package:ite/features/groups/presentation/views/widget/group_member.dart';
import 'package:ite/features/groups/presentation/views/widget/list_group.dart';

class Groups extends StatefulWidget {
  const Groups({super.key});

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(Constant.appbarheight),
              child: CustomAppBar(text: 'المجموعات')),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListGroup(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Text(
                    'لا يمكنك اضافة مجموعة سوى مرة واحدة لذا كن متأكد من خيارك.',
                    style: TextStyles().TextStyle16,
                  ),
                ),
                ElevatedButton(
                    onPressed: () => showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) => GroupMember(),
                        ),
                    child: const Text('انشاء'))
              ],
            ),
          ),
        ));
  }
}
