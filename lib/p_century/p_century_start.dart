import 'package:flutter/material.dart';
import 'package:wdf/widgets/bool_picker_row.dart';
import 'package:wdf/widgets/number_picker_row.dart';

import 'p_century.dart';

class PCenturyStart extends StatefulWidget {
  @override
  State createState() => _PCenturyStartState();
}

class _PCenturyStartState extends State<PCenturyStart> {
  int repetitions;
  int min;
  int max;

  @override
  void initState() {
    super.initState();
    repetitions = 3;
    min = 1600;
    max = 2400;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Practice centuries",
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
                max: 3000 - 100, // max > min
                step: 100,
                name: "Min Century",
                update: (val) => setState(() {
                  min = val;
                  if (min >= max) {
                    max = min + 100;
                  }
                }),
              ),
              NumberPickerRow(
                curr: max,
                min: 0 + 100, // max > min
                max: 3000,
                step: 100,
                name: "Max Century",
                update: (val) => setState(() {
                  max = val;
                  if (max <= min) {
                    min = max - 100;
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
                        builder: (_) => PCentury(repetitions: repetitions, min: min, max: max))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
