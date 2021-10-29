import 'package:flutter/material.dart';
import 'package:wdf/widgets/bool_picker_row.dart';
import 'package:wdf/widgets/number_picker_row.dart';

import 'p_day_month.dart';

class PDayMonthStart extends StatefulWidget {
  @override
  State createState() => _PDayMonthStartState();
}

class _PDayMonthStartState extends State<PDayMonthStart> {
  int count;
  bool byMonthNames;

  @override
  void initState() {
    super.initState();
    count = 25;
    byMonthNames = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Practice day-months",
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
                curr: count,
                min: 1,
                max: 50,
                name: "Count",
                update: (val) => setState(() {
                  count = val;
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
                        builder: (_) => PDayMonth(count: count, byMonthNames: byMonthNames))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
