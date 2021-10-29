import 'package:flutter/material.dart';

class NavigatorPopButton extends StatelessWidget {
  final String text;

  NavigatorPopButton({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width - 16,
              height: 60,
              child: SizedBox.expand(
                child: RaisedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    text,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
