import 'package:flutter/material.dart';

class TapWidget extends StatelessWidget {
  final Function()? onTap;
  final Function()? onLongPress;
  final Widget? child;

  const TapWidget(
      {super.key, this.onTap, this.onLongPress, this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          child: child,
        ));
  }
}
