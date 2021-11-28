import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miaged_app/Login/login_screen.dart';
import 'package:miaged_app/Signup/signup_screen.dart';
import 'package:miaged_app/Welcome/components/background.dart';
import 'package:miaged_app/Widgets/rounded_button.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WelcomeBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Miaged",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Signika",
                  fontSize: 60.0,
                  color: Colors.deepPurple[100]
              ),
            ),

            SizedBox(height: size.height * 0.05),
            SvgPicture.asset("assets/icons/chat.svg",
            height: size.height * 0.45,
            ),

            //BOUTON DE LOGIN
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "CONNEXION",
              press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "INSCRIPTION",
              color: Colors.deepPurple[100],
              textColor: Colors.black,
              press: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
