import 'package:flutter/material.dart';
import 'package:wdf/widgets/bool_picker_row.dart';
import 'package:wdf/widgets/number_picker_row.dart';

import 'p_full.dart';

class PFullStart extends StatefulWidget {
  @override
  State createState() => _PFullStartState();
}

class _PFullStartState extends State<PFullStart> {
  int count;
  int minYear;
  int maxYear;
  int minCentury;
  int maxCentury;
  bool byMonthNames;

  @override
  void initState() {
    super.initState();
    count = 20;
    minYear = 0;
    maxYear = 99;
    minCentury = 1600;
    maxCentury = 2400;
    byMonthNames = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Practice Full Dates",
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
                max: 100,
                name: "Count",
                update: (val) => setState(() {
                  count = val;
                }),
              ),
              NumberPickerRow(
                curr: minYear,
                min: 0,
                max: 99 - 1,
                // max > min
                name: "Min Year",
                update: (val) => setState(() {
                  minYear = val;
                  if (minYear >= maxYear) {
                    maxYear = minYear + 1;
                  }
                }),
              ),
              NumberPickerRow(
                curr: maxYear,
                min: 0 + 1,
                // max > min
                max: 99,
                name: "Max Year",
                update: (val) => setState(() {
                  maxYear = val;
                  if (maxYear <= minYear) {
                    minYear = maxYear - 1;
                  }
                }),
              ),
              NumberPickerRow(
                curr: minCentury,
                min: 0,
                max: 3000,
                step: 100,
                name: "Min Century",
                update: (val) => setState(() {
                  minCentury = val;
                  if (minCentury > maxCentury) {
                    maxCentury = minCentury;
                  }
                }),
              ),
              NumberPickerRow(
                curr: maxCentury,
                min: 0,
                max: 3000,
                step: 100,
                name: "Max Century",
                update: (val) => setState(() {
                  maxCentury = val;
                  if (maxCentury < minCentury) {
                    minCentury = maxCentury;
                  }
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
                onPressed: () =>
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (_) => PFull(
                              count: count,
                              minYear: minYear,
                              maxYear: maxYear,
                              minCentury: minCentury,
                              maxCentury: maxCentury,
                              byMonthNames: byMonthNames,
                            ))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
