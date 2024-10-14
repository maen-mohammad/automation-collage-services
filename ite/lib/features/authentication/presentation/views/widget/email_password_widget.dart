import 'package:flutter/cupertino.dart';
import 'package:ite/features/authentication/presentation/views/widget/entry_field.dart';

class EmailPasswordWidget extends StatefulWidget {
  const EmailPasswordWidget({super.key});

  @override
  State<EmailPasswordWidget> createState() => _EmailPasswordWidgetState();
}

class _EmailPasswordWidgetState extends State<EmailPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        EntryField(
          title: 'الاسم',
        ),
        EntryField(title: "كلمة المرور", isPassword: true),
      ],
    );
  }
}
