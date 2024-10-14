import 'package:flutter/material.dart';
import 'package:ite/core/utils/text_styles.dart';

class GroupGrid extends StatelessWidget {
  final Map names;

  const GroupGrid({super.key, required this.names});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2,
          crossAxisSpacing: 12,
          // mainAxisSpacing: 10
        ),
        itemCount: 6,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Align(
              alignment: Alignment.center,
              child: Text(
                names['student${index + 1}'],
                style: TextStyles().TextStyle16,
              ));
        },
      ),
    );
  }
}
