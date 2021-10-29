import 'package:flutter/material.dart';
import 'package:wdf/widgets/named_navigator_button.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select mode to play"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NamedNavigatorButton(
            route: "/PMonth",
            text: "Practice Months",
          ),
          NamedNavigatorButton(route: "/PYear", text: "Practice Years"),
          NamedNavigatorButton(route: "/PCentury", text: "Practice Centuries"),
          NamedNavigatorButton(route: "/PDayMonth", text: "Practice Day-Months"),
          NamedNavigatorButton(route: "/PFull", text: "Practice Full Dates"),
        ],
      ),
    );
  }
}
