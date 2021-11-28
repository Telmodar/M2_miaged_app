import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/screens/splashpage_wrapper.dart';
import 'package:miaged_app/services/authentication.dart';
import 'package:provider/provider.dart';

import 'models/mock_user.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
      //return StreamProvider<AppUser?>.value(

      // Ecoute du stream utilisateur courant
      value: AuthenticationService().user,
      initialData: null,

      child: MaterialApp(
          home: SplashPageWrapper(),
          theme: ThemeData(primarySwatch: Colors.amber)),

    );
  }
}
