import 'package:flutter/material.dart';
import 'package:wdf/logic/statistics.dart';
import 'package:wdf/widgets/named_navigator_button.dart';
import 'package:wdf/widgets/navigator_pop_button.dart';

class PDayMonthEnd extends StatelessWidget {
  final Statistics stats;

  PDayMonthEnd({@required this.stats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practice months"),
      ),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text("Congrats!!", style: Theme.of(context).textTheme.headline1,),
                Text(
                  "Average time:",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  "${avgTime()}s",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  "Mistakes:",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  "${stats.errors}",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Spacer(),
                NavigatorPopButton(
                  text: 'Again',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String avgTime() {
    int sum = stats.times
        .map((d) => d.inMilliseconds)
        .fold(0, (previousValue, element) => previousValue + element);
    return (sum / stats.times.length / 1000).toStringAsFixed(3);
  }
}
