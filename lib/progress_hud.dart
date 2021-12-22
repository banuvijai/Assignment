import 'package:assignment/utils/app_colors.dart';
import 'package:flutter/material.dart';


class ProgressHUD extends StatelessWidget {

  final Widget child;
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final MaterialColor valueColor;

  const ProgressHUD({
    required this.child,
    required this.inAsyncCall,
    required this.opacity,
    this.color = Colors.grey,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    widgetList.add(child);
    if (inAsyncCall) {
      final modal = Stack(
        children: [
           Opacity(
            opacity: opacity,
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