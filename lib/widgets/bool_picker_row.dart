import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class BoolPickerRow extends StatelessWidget {
  final bool curr;
  final String name;
  final Function(bool) update;

  BoolPickerRow({@required this.curr,
    @required this.name,
    @required this.update});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          name,
          style: Theme
              .of(context)
              .textTheme
              .bodyText2,
        ),
        Checkbox(
          value: curr,
          onChanged: update,
        ),
      ],
    );
  }
}