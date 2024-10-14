import 'package:flutter/cupertino.dart';
import 'package:ite/core/utils/text_styles.dart';

class TitleLabs extends StatelessWidget {
  const TitleLabs({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Text(
          text,
          style: TextStyles().TextStyle16,
        ),
      ),
    );
  }
}
