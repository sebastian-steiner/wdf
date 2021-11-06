import 'package:flutter/material.dart';
import 'package:wdf/logic/date.dart';
import 'package:wdf/logic/statistics.dart';
import 'package:wdf/widgets/answer_button.dart';

import 'p_century_end.dart';

class PCentury extends StatefulWidget {
  final int repetitions;
  final int min;
  final int max;

  PCentury(
      {Key key,
      @required this.repetitions,
      @required this.min,
      @required this.max})
      : super(key: key);

  @override
  _PCenturyState createState() => _PCenturyState();
}

class _PCenturyState extends State<PCentury> {
  List<int> remainingCodes;
  Color color;
  Stopwatch watch;

  Statistics stats;

  List<int> setupCodes() {
    List<int> remaining = new List();
    for (int i = widget.min; i <= widget.max; i += 100) {
      remaining.addAll(List.filled(widget.repetitions, i));
    }
    return remaining;
  }

  @override
  void initState() {
    super.initState();
    remainingCodes = setupCodes();
    remainingCodes.shuffle();
    color = Colors.black;
    watch = Stopwatch();
    stats = new Statistics();
  }

  @override
  Widget build(BuildContext context) {
    if (!watch.isRunning) {
      watch.start();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Practice Centuries"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                "Century:",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                remainingCodes.last.toString(),
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
    int curr = Date.centuryCode(remainingCodes.last ~/ 100);
    if (curr == val) {
      if (remainingCodes.length == 1) {
        stats.options.addAll({
          "repetitions": widget.repetitions.toString(),
          "min": widget.min.toString(),
          "max": widget.max.toString()
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
              MaterialPageRoute(builder: (_) => PCenturyEnd(stats: stats)));
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
