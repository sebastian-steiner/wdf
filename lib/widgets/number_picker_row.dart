import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerRow extends StatelessWidget {
  final int min;
  final int max;
  final int step;
  final int curr;
  final String name;
  final Function(int) update;

  NumberPickerRow(
      {@required this.min,
      @required this.max,
      @required this.curr,
      @required this.name,
      @required this.update,
      this.step = 1});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          name,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        FlatButton(
          child: Text(
            curr.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Theme.of(context).accentColor),
          ),
          onPressed: () => _showDialog(context),
        )
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
            minValue: min,
            maxValue: max,
            step: step,
            initialIntegerValue: curr,
            title: Text(
              "Pick $name",
              style: Theme.of(context).textTheme.headline3,
            ),
          );
        }).then((int val) {
      if (val != null) {
        update(val);
      }
    });
  }
}
