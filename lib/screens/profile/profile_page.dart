import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/models/mock_user.dart';
import 'package:miaged_app/screens/profile/profile.dart';
import 'package:miaged_app/services/database.dart';
import 'package:provider/provider.dart';


class ProfilePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUserData>.value(
      //return StreamProvider<AppUserData?>.value(
      value: DatabaseService('htjTZXVcH3QUIvxsNojBX1QXQkJ2','').user,
      child: Scaffold(
        body: ProfileWidget()
      ),
      initialData: null,
    );
  }
}
