import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wdf/logic/date.dart';
import 'package:wdf/logic/statistics.dart';
import 'package:wdf/widgets/answer_button.dart';

import 'p_full_end.dart';

class PFull extends StatefulWidget {
  final int count;
  final int minYear;
  final int maxYear;
  final int minCentury;
  final int maxCentury;
  final bool byMonthNames;

  PFull(
      {Key key,
      @required this.count,
      @required this.minYear,
      @required this.maxYear,
      @required this.minCentury,
      @required this.maxCentury,
      @required this.byMonthNames})
      : super(key: key);

  @override
  _PFullState createState() => _PFullState();
}

class _PFullState extends State<PFull> {
  List<Date> remainingCodes;
  Color color;
  Stopwatch watch;
  Random rng;

  Statistics stats;

  List<Date> setupCodes() {
    List<Date> remaining = new List();
    for (int i = 0; i < widget.count; i++) {
      remaining.add(createDate());
    }
    return remaining;
  }

  Date createDate() {
    int century =
        (rng.nextInt((widget.maxCentury - widget.minCentury) ~/ 100 + 1) *
                100) +
            widget.minCentury;
    int year =
        rng.nextInt(widget.maxYear - widget.minYear + 1) + widget.minYear;
    int month = rng.nextInt(12);
    int day = rng.nextInt(Date.maxDayFromDate(month, year: year)) + 1;
    return new Date(year: century + year, month: month, day: day);
  }

  @override
  void initState() {
    super.initState();
    rng = new Random();
    watch = Stopwatch();
    stats = new Statistics();
    remainingCodes = setupCodes();
    remainingCodes.shuffle();
    color = Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    if (!watch.isRunning) {
      watch.start();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Practice Full dates"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Date:",
                style: Theme.of(context).textTheme.headline2,
              ),
              Expanded(
                  child: AutoSizeText(
                remainingCodes.last.formatDate(widget.byMonthNames),
                style: TextStyle(fontWeight: FontWeight.bold),
                maxFontSize: 60,
                minFontSize: 50,
                maxLines: 2,
              )),
              AnswerButton(
                answer: answer,
                val: 0,
              ),
              AnswerButton(
                answer: answer,
                val: 1,
              ),
              AnswerButton(
                answer: answer,
                val: 2,
              ),
              AnswerButton(
                answer: answer,
                val: 3,
              ),
              AnswerButton(
                answer: answer,
                val: 4,
              ),
              AnswerButton(
                answer: answer,
                val: 5,
              ),
              AnswerButton(
                answer: answer,
                val: 6,
              ),
            ],
          ),
        ],
      ),
    );
  }

  void answer(int val) async {
    int curr = remainingCodes.last.weekDay();
    if (curr == val) {
      if (remainingCodes.length == 1) {
        stats.options.addAll({
          "count": widget.count.toString(),
          "minYear": widget.minYear.toString(),
          "maxYear": widget.maxYear.toString(),
          "minCentury": widget.minCentury.toString(),
          "maxCentury": widget.maxCentury.toString(),
          "byMonthNames": widget.byMonthNames.toString()
        });
      }

      setState(() {
        // time
        watch.stop();
        stats.times.add(watch.elapsed);
        watch.reset();

        color = Colors.green;
        remainingCodes.removeLast();
        if (remainingCodes.isEmpty) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => PFullEnd(stats: stats)));
        }
      });
    } else {
      setState(() {
        stats.errors++;
        color = Colors.redAccent;
      });
    }
  }
}
