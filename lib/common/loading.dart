import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);
  //const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: SpinKitFadingCube(
          color: Colors.red,
          size: 60.0,
        ),
      ),
    );
  }
}
