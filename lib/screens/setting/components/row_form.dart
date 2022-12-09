import 'package:flutter/material.dart';
import 'package:gateflow/constants.dart';

class RowFormField extends StatefulWidget {
  final String hite1;
  final String hite2;

  const RowFormField({
    Key? key,
    required this.hite1,
    required this.hite2,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RowFormField();
}

class _RowFormField extends State<RowFormField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: textFormField(widget.hite1),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: textFormField(widget.hite2),
          ),
        ),
        // ),
      ],
    );
  }

  TextFormField textFormField(String hite) {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        hoverColor: Colors.blueGrey,
        border: OutlineInputBorder(),
        labelText: hite,
        labelStyle: TextStyle(color: Colors.white70),
        hintText: hite,
        hintStyle: TextStyle(color: Colors.white70),
      ),
    );
  }
}
