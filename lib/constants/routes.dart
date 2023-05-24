import 'package:flutter/material.dart';

class Routes {
  static Routes instanse = Routes();
  Future<dynamic> pushAndRemoveUtil(Widget page, BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }

  Future<dynamic> push(Widget page, BuildContext context) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
  }
}
