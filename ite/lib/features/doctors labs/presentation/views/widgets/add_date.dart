import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';
import 'package:intl/intl.dart';

class AddDate extends StatelessWidget {
  const AddDate({
    super.key,
    required DateTime? selectdate,
  }) : _selectdate = selectdate;

  final DateTime? _selectdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * .7,
      decoration: BoxDecoration(
        color: mycolor.hcolor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: (_selectdate == null)
            ? Text('ادخل التاريخ')
            : Text(
                DateFormat.yMMMd('ar').format(_selectdate),
                // '${_starttime!.minute.toString()} : ${_starttime!.hourOfPeriod.toString()}',
              ),
      ),
    );
  }
}
