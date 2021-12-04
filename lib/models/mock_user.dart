import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {

  final String uid;

  AppUser(this.uid);
  
  String getUid(){
    return this.uid;
  }

}

class AppUserData{

  final String uid;
  final String login;
  final String password;
  DateTime birthdate;
  final String address;
  final String zipCode;
  final String city;

  AppUserData(this.uid, this.login, this.password, this.birthdate, this.address, this.zipCode, this.city);

}