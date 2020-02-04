import 'package:flutter/material.dart';
import 'dart:async';

class Observer<T> extends StatelessWidget {
  @required
  final Stream<T> stream;
  final Function onSuccess;

  final Function onError;

  const Observer({this.onError, this.onSuccess, this.stream});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return onError(context, snapshot.error);
        }
        snapshot.hasData
            ? onSuccess(context, snapshot)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
