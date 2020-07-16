import 'package:flutter/material.dart';

import '../../../../core/error/failure.dart';

class ErrorMessage extends StatelessWidget {
  final Failure failure;
  final String message;
  final String suggestion;

  const ErrorMessage({
    Key key,
    @required this.failure,
    @required this.message,
    this.suggestion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (failure != SettingsFailure())
          Text(
            'ERROR',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            suggestion,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
