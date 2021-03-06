import 'package:flutter/material.dart';
import 'package:wdf/logic/date.dart';
import 'package:wdf/logic/statistics.dart';
import 'package:wdf/widgets/answer_widget.dart';

import 'p_year_end.dart';

class PYear extends StatefulWidget {
  final int repetitions;
  final int min;
  final int max;

  PYear(
      {Key key,
      @required this.repetitions,
      @required this.min,
      @required this.max})
      : super(key: key);

  @override
  _PYearState createState() => _PYearState();
}

class _PYearState extends State<PYear> {
  List<int> remainingCodes;
  Color color;
  Stopwatch watch;

  Statistics stats;

  List<int> setupCodes() {
    List<int> remaining = new List();
    for (int i = widget.min; i <= widget.max; i++) {
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
        title: Text("Practice Years"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              Text(
                "Year:",
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
          )),
        ],
      ),
    );
  }

  void answer(int val) async {
    int curr = Date.yearCode(remainingCodes.last);
    if (curr == val) {
      if (remainingCodes.length == 1) {
        stats.options.addAll({
          "repetitions": widget.repetitions.toString(),
          "min": widget.min.toString(),
          "max": widget.max.toString(),
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
              MaterialPageRoute(builder: (_) => PYearEnd(stats: stats)));
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
