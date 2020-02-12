import 'package:flutter/material.dart';
import 'dart:async';

class Observer<T> extends StatelessWidget {
  @required
  final Stream<T> stream;
  final Function onSuccess;

  final Function onError;
  final Function onWaiting;
  Function get _defaultonWaiting => (context) => Center(
        child: CircularProgressIndicator(),
      );
  Function get _defaultonError => (
        context,
        error,
      ) =>
          Text(error);

  const Observer({this.onError, this.onSuccess, this.stream, this.onWaiting});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.hasError) {
          return (onError != null)
              ? onError(context, snapshot.error)
              : _defaultonError(context, snapshot.error);
        }
        if (snapshot.hasData) {
          return onSuccess(context, snapshot);
        } else {
          return (onWaiting != null)
              ? onWaiting(context)
              : _defaultonWaiting(context);
        }
      },
    );
  }
}
// class Conextion{
//   final 
// }