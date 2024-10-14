import 'package:flutter/material.dart';
import 'package:ite/core/utils/constant.dart';
// import 'package:ite/core/utils/text_styles.dart';
// import 'package:ite/features/student%20schedule/presentation/views/widgets/custom_divider.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/custom_dropdown_menu.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/custom_textfield.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/form_text.dart';

class FormData extends StatelessWidget {
  const FormData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Constant.formpadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FormText(text: 'الدكتور'),
            CustomDropdownMenu(),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Constant.formpadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FormText(text: 'المشروع'),
            CustomDropdownMenu(),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Constant.formpadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FormText(text: 'العنوان'),
            CustomTextField(
              width: 0.7,
              hinttext: 'عنوان المشروع',
            ),
          ],
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.symmetric(vertical: Constant.formpadding),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       FormText(text: 'السبب'),
      //       CustomTextField(
      //         width: 0.7,
      //         hinttext: 'سبب المقابلة',
      //       ),
      //     ],
      //   ),
      // ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: Constant.formpadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FormText(text: 'رقم المجموعة'),
            CustomTextField(
              width: 0.7,
              hinttext: 'رقم المجموعة',
            ),
          ],
        ),
      ),
    ]);
  }
}
