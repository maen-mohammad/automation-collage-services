import 'package:flutter/material.dart';
import 'package:ite/core/utils/text_styles.dart';

class FormText extends StatelessWidget {
  const FormText({super.key, required this.text, this.textAlign});
  final String text;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .2,
      child: Text(
        text,
        style: TextStyles().TextStyle16,
        textAlign: (textAlign == null) ? TextAlign.start : textAlign,
      ),
    );
  }
}
