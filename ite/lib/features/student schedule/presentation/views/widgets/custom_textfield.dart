import 'package:flutter/material.dart';
import 'package:ite/core/utils/colors.dart';

final item = ['روان قرعوني', 'سعيد ابو طراب', 'ابي صندوق'];

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key, required this.width, required this.hinttext});
  final double width;
  final String hinttext;
  @override
  State<CustomTextField> createState() =>
      _CustomTextFieldState(width: width, hinttext: hinttext);
}

class _CustomTextFieldState extends State<CustomTextField> {
  final double width;
  final String hinttext;

  _CustomTextFieldState({required this.width, required this.hinttext});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * width,
      decoration: BoxDecoration(
          color: mycolor.hcolor, borderRadius: BorderRadius.circular(12)),
      child: TextField(
        textAlign: TextAlign.center,

        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hinttext,
            hintStyle: TextStyle(color: Colors.black.withOpacity(.4))
            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.blue),
            //   borderRadius: BorderRadius.circular(12),
            // ),
            ),
        // autofillHints: <String>['dmijdi'],
        // maxLength: 100,
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(right: 10.0, left: 5.0),
    //   child: Container(
    //     decoration: BoxDecoration(
    //         color: mycolor.hcolor, borderRadius: BorderRadius.circular(12)),
    //     width: MediaQuery.of(context).size.width * .7,
    //     child: DropdownButton(
    //         borderRadius: BorderRadius.circular(12),
    //         dropdownColor: mycolor.hcolor,
    //         isExpanded: true,
    //         value: dropdownValue,
    //         hint: Text(item.first),
    //         // icon: Icon(Icons.arrow_drop_down),
    //         // alignment: AlignmentDirectional.centerStart,
    //         // iconSize: 42,
    //         underline: SizedBox(),
    //         items: item.map<DropdownMenuItem<String>>((String value) {
    //           return DropdownMenuItem(
    //             alignment: AlignmentDirectional.center,
    //             value: value,
    //             child: Text(value),
    //           );
    //         }).toList(),
    //         onChanged: (String? value) {
    //           setState(() {
    //             dropdownValue = value!;
    //           });
    //         }),
    //   ),
    // );

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
