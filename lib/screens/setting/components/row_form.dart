import 'package:flutter/material.dart';
import 'package:gateflow/constants.dart';

import '../../../theme/theme.dart';

class RowFormField extends StatefulWidget {
  final String hite1;
  final String hite2;
  final String? initValue1;
  final String? initValue2;

  const RowFormField({
    Key? key,
    required this.hite1,
    required this.hite2,
    this.initValue1,
    this.initValue2, required this.vc1, required this.vc2,
  }) : super(key: key);

  final ValueChanged vc1;
  final ValueChanged vc2;

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
            child: textFormField(
                widget.hite1, widget.initValue1, widget.vc1),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: textFormField(
                widget.hite2, widget.initValue2, widget.vc2),
          ),
        ),
        // ),
      ],
    );
  }

  TextFormField textFormField(
      String hite, String? initValue, ValueChanged changed) {
    return TextFormField(
      autofocus: true,
      initialValue: initValue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hite为空';
        }
        return null;
      },
      onSaved: (value) {
        changed(value);
      },
      onChanged: (value) {
        changed(value);
      },
      decoration: InputDecoration(
        hoverColor: Colors.blueGrey,
        border: outlineInputBorder,
        labelText: hite,
        labelStyle: TextStyle(color: Colors.white70),
        hintText: hite,
        hintStyle: TextStyle(color: Colors.white70),
      ),
    );
  }
}
