import 'package:flutter/material.dart';

class DissmissableWidget<T> extends StatelessWidget {
  //const DissmissableWidget({Key? key}) : super(key: key);
  final T item;
final Widget child;

const DissmissableWidget({
  @required this.item,
  @required this.child,

  Key key,
}):super(key: key);

  @override
  Widget build(BuildContext context) => Dismissible(
      key: ObjectKey(item),
      child: child
  );
}
