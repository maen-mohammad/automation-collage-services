import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';

final item = ['روان قرعوني', 'سعيد ابو طراب', 'ابي صندوق'];

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu({super.key});

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String dropdownValue = item.first;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: 200,
    //   child: TextField(

    //       // autofillHints: <String>['dmijdi'],
    //       // maxLength: 100,
    //       ),
    // );
    return Container(
      decoration: BoxDecoration(
          color: mycolor.hcolor, borderRadius: BorderRadius.circular(12)),
      width: MediaQuery.of(context).size.width * .7,
      child: DropdownButton(
          borderRadius: BorderRadius.circular(12),
          dropdownColor: mycolor.hcolor,
          isExpanded: true,
          value: dropdownValue,
          hint: Text(item.first),
          // icon: Icon(Icons.arrow_drop_down),
          // alignment: AlignmentDirectional.centerStart,
          // iconSize: 42,
          underline: SizedBox(),
          items: item.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              alignment: AlignmentDirectional.center,
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          }),
    );

    // return DropdownMenu<String>(
    //   initialSelection: item.first,
    //   menuHeight: 100,
    //   width: 200,
    //   enableFilter: true,
    //   onSelected: (String? value) {
    //     // This is called when the user selects an item.
    //     setState(() {
    //       dropdownValue = value!;
    //     });
    //   },
    //   dropdownMenuEntries: item.map<DropdownMenuEntry<String>>((String value) {
    //     return DropdownMenuEntry<String>(value: value, label: value);
    //   }).toList(),
    // );
  }
}
