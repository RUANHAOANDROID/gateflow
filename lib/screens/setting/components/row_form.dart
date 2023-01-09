import 'package:flutter/material.dart';
import 'package:gateflow/constants.dart';

import '../../../theme/theme.dart';

class RowFormField extends StatefulWidget {
  final String hite1;
  final String hite2;

  const RowFormField({
    Key? key,
    required this.hite1,
    required this.hite2,
    required this.vc1,
    required this.vc2,
    required this.teController1,
    required this.teController2,
  }) : super(key: key);

  final ValueChanged vc1;
  final ValueChanged vc2;

  final TextEditingController teController1;
  final TextEditingController teController2;

  @override
  State<StatefulWidget> createState() => _RowFormField();
}

class _RowFormField extends State<RowFormField> {
  @override
  Widget build(BuildContext context) {
    var padding = const EdgeInsets.all(defaultPadding / 2);
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: padding,
            child:
                textFormField(widget.hite1, widget.vc1, widget.teController1),
          ),
        ),
        Expanded(
          child: Padding(
            padding: padding,
            child:
                textFormField(widget.hite2, widget.vc2, widget.teController2),
          ),
        ),
        // ),
      ],
    );
  }

  TextFormField textFormField(String hite, ValueChanged changed, controller) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      //initialValue: initValue,
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
        //hoverColor: Colors.blueGrey,
        border: outlineInputBorder,
        labelText: hite,
        //labelStyle: const TextStyle(color: Colors.white70),
        hintText: hite,
        //hintStyle: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
