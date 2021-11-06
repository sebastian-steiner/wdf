import 'package:flutter/material.dart';
import 'package:wdf/widgets/answer_button.dart';

class AnswerWidget extends StatelessWidget {
  final Function(int) answer;

  AnswerWidget({@required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnswerButton(answer: answer, val: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnswerButton(answer: answer, val: 1),
                AnswerButton(answer: answer, val: 3),
                AnswerButton(answer: answer, val: 5),
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnswerButton(answer: answer, val: 2),
                AnswerButton(answer: answer, val: 4),
                AnswerButton(answer: answer, val: 6),
              ],
            ))
          ],
        )
      ],
    );
  }
}
