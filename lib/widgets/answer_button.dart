import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final Function(int) answer;
  final int val;

  AnswerButton({@required this.answer, @required this.val});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 14,
        width: MediaQuery.of(context).size.width / 3,
        child: RaisedButton(
          onPressed: () => answer(val),
          child: Text(
            val.toString(),
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }
}