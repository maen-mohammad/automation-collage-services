import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EntryField extends StatefulWidget {
   EntryField( {super.key,  required this.title ,this.isPassword = false});
  final String title;
   bool? isPassword = false;
  @override
  State<EntryField> createState() => _EntryFieldState();
}

class _EntryFieldState extends State<EntryField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            // width: MediaQuery.of(context).size.width * .7,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 242, 231, 215),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              obscureText: widget.isPassword!,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(right: 8.0),
                // fillColor: const Color.fromARGB(255, 242, 231, 215),
                // filled: true,
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
