import 'package:flutter/material.dart';
import 'package:wdf/widgets/bool_picker_row.dart';
import 'package:wdf/widgets/number_picker_row.dart';

import 'p_month.dart';

class PMonthStart extends StatefulWidget {
  @override
  State createState() => _PMonthStartState();
}

class _PMonthStartState extends State<PMonthStart> {
  int repetitions;
  bool byMonthNames;

  @override
  void initState() {
    super.initState();
    repetitions = 3;
    byMonthNames = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Practice months",
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: Colors.white),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Setup",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              NumberPickerRow(
                curr: repetitions,
                min: 1,
                max: 10,
                name: "Repetitions",
                update: (val) => setState(() {
                  repetitions = val;
                }),
              ),
              BoolPickerRow(
                curr: byMonthNames,
                name: "By month names",
                update: (val) => setState(() {
                  byMonthNames = val;
                }),
              ),
              Spacer(),
              RaisedButton(
                child: Text(
                  "Start practice round!",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                onPressed: () => Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (_) => PMonth(repetitions: repetitions, byMonthNames: byMonthNames))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
