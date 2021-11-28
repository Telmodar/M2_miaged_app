import 'package:flutter/material.dart';


class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Créer un compte MIAGED !" : "Déjà un compte ?",
          style: TextStyle(color: Colors.deepPurple),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "S'inscrired" : "Se Connected",
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
