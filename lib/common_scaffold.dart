import 'package:flutter/material.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold(
      {Key key,
      this.backgroundColor,
      this.appBar,
      this.child,
      this.resizeToAvoidBottomInset = false})
      : super(key: key);

  final Widget child;
  final Widget appBar;
  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor:
          backgroundColor ?? Theme.of(context).colorScheme.background,
      appBar: appBar != null ? appBar as PreferredSizeWidget : null,
      body: child,
    );
  }
}
