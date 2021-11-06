import 'package:flutter/material.dart';
import 'package:wdf/logic/date.dart';
import 'package:wdf/logic/statistics.dart';
import 'package:wdf/widgets/answer_button.dart';

import 'p_month_end.dart';

class PMonth extends StatefulWidget {
  final int repetitions;
  final bool byMonthNames;

  PMonth({Key key, @required this.repetitions, @required this.byMonthNames}) : super(key: key);

  @override
  _PMonthState createState() => _PMonthState();
}

class _PMonthState extends State<PMonth> {
  List<int> remainingCodes;
  Color color;
  Stopwatch watch;

  Statistics stats;

  List<int> setupCodes() {
    List<int> remaining = new List();
    for (int i = 0, n = Date.monthCodes.length; i < n; i++) {
      remaining.addAll(List.filled(widget.repetitions, i));
    }
    return remaining;
  }

  @override
  void initState() {
    super.initState();
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
        title: Text("Practice Months"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Month:",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                widget.byMonthNames ? Date.monthNames[remainingCodes.last] : (remainingCodes.last + 1).toString(),
                style: Theme.of(context).textTheme.headline1.copyWith(color: color),
              ),
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
    int curr = Date.monthCodes[remainingCodes.last];
    if (curr == val) {
      if (remainingCodes.length == 1) {
        stats.options.addAll({
          "repetitions": widget.repetitions.toString(),
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
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => PMonthEnd(stats: stats)));
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
