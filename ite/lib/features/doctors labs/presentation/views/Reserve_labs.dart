import 'package:flutter/material.dart';
import 'package:ite/features/doctors%20labs/presentation/view%20model/get%20available%20place/get_available_place_cubit.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/add_date.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/add_time.dart';
import 'package:ite/features/doctors%20labs/presentation/views/widgets/grid_labs.dart';
import 'dart:ui' as ui;
import 'package:ite/core/utils/colors.dart';
import 'package:ite/core/utils/constant.dart';
import 'package:ite/core/utils/custom_app_bar.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/add_button.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/custom_divider.dart';
import 'package:ite/features/student%20schedule/presentation/views/widgets/form_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReserveLabs extends StatefulWidget {
  const ReserveLabs({super.key, required this.type});
  final String type;
  @override
  State<ReserveLabs> createState() => _ReserveLabsState();
}

class _ReserveLabsState extends State<ReserveLabs> {
  bool state = false;
  DateTime? _selectdate;
  void _datepicker(BuildContext context) {
    showDatePicker(
      context: context,
      confirmText: 'موافق',
      cancelText: 'الغاء',
      helpText: 'ادخل التاريخ',
      // locale:'ar',
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 180),
      ),
    ).then(
      (value) {
        setState(
          () {
            _selectdate = value;
          },
        );
      },
    );
  }

  TimeOfDay? _starttime;
  TimeOfDay? _endtime;
  void _timepicker(BuildContext context, bool time) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 9, minute: 0),
      initialEntryMode: TimePickerEntryMode.input,
      confirmText: 'موافق',
      cancelText: 'الغاء',
      helpText: 'ادخل الوقت',
    ).then(
      (value) {
        setState(
          () {
            time ? _starttime = value : _endtime = value;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Constant.appbarheight),
          child: CustomAppBar(
            text: 'اضافة حجز',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: Constant.formpadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FormText(text: 'التاريخ'),
                    GestureDetector(
                      onTap: () => _datepicker(context),
                      child: AddDate(selectdate: _selectdate),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: Constant.formpadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FormText(
                      text: 'من الساعة',
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                        onTap: () => _timepicker(context, true),
                        child: AddTime(
                          time: _starttime,
                        )),
                    FormText(
                      text: 'الى الساعة',
                      textAlign: TextAlign.center,
                    ),
                    GestureDetector(
                      onTap: () => _timepicker(context, false),
                      child: AddTime(time: _endtime),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: GestureDetector(
                  onTap: () {
                    if (_selectdate != null &&
                        _starttime != null &&
                        _endtime != null) {
                      BlocProvider.of<GetAvailablePlaceCubit>(context)
                          .getplace({
                        'date':
                            '${_selectdate?.year.toString()}-${_selectdate?.month.toString().padLeft(2, '0')}-${_selectdate?.day.toString().padLeft(2, '0')}',
                        'from':
                            "${_starttime?.hourOfPeriod == 0 ? 12 : _starttime?.hourOfPeriod.toString().padLeft(2, '0')}:${_starttime?.minute.toString().padLeft(2, '0')} ",
                        'to':
                            "${_endtime?.hourOfPeriod == 0 ? 12 : _endtime?.hourOfPeriod.toString().padLeft(2, '0')}:${_endtime?.minute.toString().padLeft(2, '0')} "
                      });
                      setState(() {
                        state = true;
                      });
                    }
                  },
                  child: AddButton(
                    text: 'بحث',
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.3,
                    fontsize: 18,
                    color: mycolor.lcolor,
                  ),
                ),
              ),
              CustomDivider(),
              state == true
                  ? GridLabs(
                      type: widget.type,
                      start:
                          "${_starttime?.hourOfPeriod == 0 ? 12 : _starttime?.hourOfPeriod.toString().padLeft(2, '0')}:${_starttime?.minute.toString().padLeft(2, '0')} ",
                      end:
                          "${_endtime?.hourOfPeriod == 0 ? 12 : _endtime?.hourOfPeriod.toString().padLeft(2, '0')}:${_endtime?.minute.toString().padLeft(2, '0')} ",
                      date:
                          '${_selectdate?.year.toString()}-${_selectdate?.month.toString().padLeft(2, '0')}-${_selectdate?.day.toString().padLeft(2, '0')}',
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
