import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miaged_app/models/mock_user.dart';
import 'package:miaged_app/services/database.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  AppUser _userFromFirebase(User user){
    //  AppUser? _userFromFirebase(User user){
    return user != null ? AppUser(user.uid) : null;
  }

  Stream<AppUser> get user {
    //  Stream<AppUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
    //return _auth.authStateChanges().map(event) => _userFromFirebaseUser;
  }



  // Méthode Modification avec mail et mdp
  Future updatePassword(String oldPassword,String newPassword) async{
    final user = await FirebaseAuth.instance.currentUser;
    final credential = EmailAuthProvider.credential(email: user.email, password: oldPassword);

    user.reauthenticateWithCredential(credential).then((value){
      user.updatePassword(newPassword).then((value) {
        print('Your password has been changed!');
        //print('Your password has been changed!'");
      }).catchError((error){
        print('Modification failed!');
      });
    }).catchError((error){
      print(error);
    });
  }


  // Méthode Connexion avec mail et mdp
  Future signInWithMailAndPassword(String email, String password) async {
    try{
        UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
        User user = result.user;

        if(DatabaseService(user.uid,'').user.length==0){
          await DatabaseService(user.uid,'').saveUser(email, password, DateTime(1970, 1, 1), '', '', '');
        }

        return _userFromFirebase(user);
      } catch(exception){
        print(exception.toString());
        return null;
    }
  }

  // Méthode Création de compte avec mail et mdp
  Future registerInWithMailAndPassword(String name, String email, String password) async   {

    try{
      UserCredential result =
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      if(DatabaseService(user.uid,'').user.length == 0){
        await DatabaseService(user.uid,'').saveUser(email, password, DateTime(1970, 1, 1), name, '', '',);
      }

      return _userFromFirebase(user);
    } catch(exception){
      print(exception.toString());
      return null;
    }
  }


  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(exception){
      print(exception.toString());
      return null;
    }
  }
}