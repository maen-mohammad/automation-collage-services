import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';

class AddTime extends StatelessWidget {
  const AddTime({
    super.key,
    required TimeOfDay? time,
  }) : _time = time;

  final TimeOfDay? _time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * .2,
      decoration: BoxDecoration(
        color: mycolor.hcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: (_time == null)
            ? Text('00 : 00')
            : Text(
                // DateFormat.yMMMd('ar').format(_selectdate!),
                '${_time!.minute.toString()} : ${_time!.hourOfPeriod.toString()}',
              ),
      ),
    );
  }
}
