import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  final String label;

  const LoadingIndicator({this.label = 'Loading'});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SpinKitChasingDots(color: Colors.orange),
        SizedBox(height: 10),
        Text(label, style: TextStyle(fontSize: 26, color: Colors.grey)),
      ],
    );
  }
}
