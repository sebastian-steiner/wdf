import 'dart:math';

import 'package:flutter/material.dart';

class NamedNavigatorButton extends StatelessWidget {
  final String route;
  final String text;

  NamedNavigatorButton({@required this.route, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: max(MediaQuery
                  .of(context)
                  .size
                  .width - 16, 0),
              height: 60,
              child: SizedBox.expand(
                child: RaisedButton(
                  onPressed: () => Navigator.of(context).pushNamed(route),
                  child: Text(text, style: Theme
                      .of(context)
                      .textTheme
                      .bodyText2,),
                ),
              ))
        ],
      ),
    );
  }
}