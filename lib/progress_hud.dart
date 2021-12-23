import 'package:assignment/utils/app_colors.dart';
import 'package:flutter/material.dart';


class ProgressHUD extends StatelessWidget {

  final Widget child;
  final bool inAsyncCall;
  final Color color;

  ProgressHUD({
    required this.child,
    required this.inAsyncCall,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(primaryColor),
              )
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}