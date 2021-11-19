import 'package:flutter/material.dart';
import 'package:wdf/widgets/bool_picker_row.dart';
import 'package:wdf/widgets/number_picker_row.dart';

import 'p_year_full.dart';

class PYearFullStart extends StatefulWidget {
  @override
  State createState() => _PYearFullStartState();
}

class _PYearFullStartState extends State<PYearFullStart> {
  int count;
  int minCentury;
  int maxCentury;
  int minYear;
  int maxYear;

  @override
  void initState() {
    super.initState();
    count = 30;
    minYear = 0;
    maxYear = 99;
    minCentury = 1600;
    maxCentury = 2400;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Practice Full Years",
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
                max: 250,
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
                max: 3000 - 100,
                // max > min
                step: 100,
                name: "Min Century",
                update: (val) => setState(() {
                  minCentury = val;
                  if (minCentury >= maxCentury) {
                    maxCentury = minCentury + 100;
                  }
                }),
              ),
              NumberPickerRow(
                curr: maxCentury,
                min: 0 + 100,
                // max > min
                max: 3000,
                step: 100,
                name: "Max Century",
                update: (val) => setState(() {
                  maxCentury = val;
                  if (maxCentury <= minCentury) {
                    minCentury = maxCentury - 100;
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
                        builder: (_) => PYearFull(
                            count: count,
                            minCentury: minCentury,
                            maxCentury: maxCentury,
                            minYear: minYear,
                            maxYear: maxYear))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
