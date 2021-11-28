import 'package:flutter/material.dart';
import 'package:miaged_app/models/mock_user.dart';
import 'package:miaged_app/screens/authentification/authentification_page.dart';
import 'package:provider/provider.dart';
import 'home/home_page.dart';

class SplashPageWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    //final user = Provider.of<AppUser?>(context);
    if(user==null){
      return AuthenticationPage();
    }
    else{
      return HomePage();
    }
  }
}
