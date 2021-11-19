import 'package:flutter/material.dart';
import 'package:wdf/widgets/bool_picker_row.dart';
import 'package:wdf/widgets/number_picker_row.dart';

import 'p_year.dart';

class PYearStart extends StatefulWidget {
  @override
  State createState() => _PYearStartState();
}

class _PYearStartState extends State<PYearStart> {
  int repetitions;
  int min;
  int max;

  @override
  void initState() {
    super.initState();
    repetitions = 3;
    min = 0;
    max = 99;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Practice Years",
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
              NumberPickerRow(
                curr: min,
                min: 0,
                max: 99 - 1, // max > min
                name: "Min Year",
                update: (val) => setState(() {
                  min = val;
                  if (min >= max) {
                    max = min + 1;
                  }
                }),
              ),
              NumberPickerRow(
                curr: max,
                min: 0 + 1, // max > min
                max: 99,
                name: "Max Year",
                update: (val) => setState(() {
                  max = val;
                  if (max <= min) {
                    min = max - 1;
                  }
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
                        builder: (_) => PYear(repetitions: repetitions, min: min, max: max))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
