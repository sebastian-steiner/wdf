import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wdf/logic/date.dart';
import 'package:wdf/logic/statistics.dart';
import 'package:wdf/widgets/answer_widget.dart';

import 'p_year_full_end.dart';

class PYearFull extends StatefulWidget {
  final int count;
  final int minCentury;
  final int maxCentury;
  final int minYear;
  final int maxYear;

  PYearFull(
      {Key key,
      @required this.count,
      @required this.minCentury,
      @required this.maxCentury,
      @required this.minYear,
      @required this.maxYear})
      : super(key: key);

  @override
  _PYearFullState createState() => _PYearFullState();
}

class _PYearFullState extends State<PYearFull> {
  List<int> remainingCodes;
  Color color;
  Stopwatch watch;
  Random rng;

  Statistics stats;

  List<int> setupCodes() {
    List<int> remaining = new List();
    for (int i = 0; i < widget.count; i++) {
      remaining.add(createYear(widget.minYear, widget.maxYear,
          widget.minCentury, widget.maxCentury));
    }
    return remaining;
  }

  int createYear(minY, maxY, minC, maxC) {
    int century = rng.nextInt((maxC - minC) ~/ 100) + minC ~/ 100;
    int year = rng.nextInt(maxY - minY) + minY;
    return century * 100 + year;
  }

  @override
  void initState() {
    super.initState();
    rng = new Random();
    stats = new Statistics();
    remainingCodes = setupCodes();
    remainingCodes.shuffle();
    color = Colors.black;
    watch = Stopwatch();
  }

  @override
  Widget build(BuildContext context) {
    if (!watch.isRunning) {
      watch.start();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Practice Full Years"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              Text(
                "Date:",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                remainingCodes.last.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(color: color),
              ),
              AnswerWidget(answer: answer)
            ],
          ))
        ],
      ),
    );
  }

  void answer(int val) async {
    int curr = Date.centuryCode(remainingCodes.last ~/ 100) +
        Date.yearCode(remainingCodes.last % 100);
    curr %= 7;

    if (curr == val) {
      if (remainingCodes.length == 1) {
        stats.options.addAll({
          "count": widget.count.toString(),
          "minCentury": widget.minCentury.toString(),
          "maxCentury": widget.maxCentury.toString(),
          "minYear": widget.minYear.toString(),
          "maxYear": widget.maxYear.toString()
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
              MaterialPageRoute(builder: (_) => PYearFullEnd(stats: stats)));
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
