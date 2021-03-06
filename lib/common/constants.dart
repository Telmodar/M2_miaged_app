import 'package:flutter/material.dart';

// VALEURS COMMUNNE A L'APP

const textInputDecoration = InputDecoration(
  fillColor: Colors.white70,
  filled: true,
  contentPadding: EdgeInsets.all(14.0),
  errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color:Colors.red, width: 3.0)
      ),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.red, width: 3.0)
    ),

  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color:Colors.blueAccent, width: 2.0
    )
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.deepPurple, width: 1.5
    )
  )
);