import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


//PAGE DE LOADING
class Loading extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
     return Container(
      color: Colors.blue,
      child:
      Center(

        child: SpinKitFadingCube(
          color: Colors.red,
          size: 60.0,

        ),
      ),
    );
  }
}
