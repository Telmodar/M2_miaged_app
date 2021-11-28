import 'package:flutter/material.dart';
import 'package:miaged_app/common/constants.dart';
import 'package:miaged_app/common/loading.dart';
import 'package:miaged_app/services/authentication.dart';

class AuthenticationPage extends StatefulWidget{
  @override
  _AthenticationPageState createState() => _AthenticationPageState();

}

class _AthenticationPageState extends State<AuthenticationPage>{
  final _formKey = GlobalKey<FormState>();
  final AuthenticationService _auth = AuthenticationService();
  String error = '';
  bool loading = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var showSignIn = true; // Final ???

  @override
  void dispose(){
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleView() {
    setState(() {
          _formKey.currentState.reset();
          error = '';
          emailController.text="";
          passwordController.text = "";
          showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context){
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text('Log In'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        child: Form(
          key:_formKey,
          child: Column(
            children: [

              // DEMANDE DU NOM
              TextFormField(
                controller: nameController,
                decoration: textInputDecoration.copyWith(hintText: 'name', labelText: 'Name'),
                validator: (value) => value.isEmpty ? "What your name ?" : "",
                //validator: (value) => value!.isEmpty ? "What your name ?" : "",
              ),
              SizedBox(height: 10.0),

              // DEMANDE DE L'EMAIL
              TextFormField(
                controller: nameController,
                decoration: textInputDecoration.copyWith(labelText: 'Mail', hintText: 'mail'),
                validator: (value) => value.isEmpty ? "What your mail adress ?" : "",
                //validator: (value) => value!.isEmpty ? "What your name ?" : "",
              ),
              SizedBox(height: 10.0),

              //DEMANDE DU PASSWORD
              TextFormField(
                controller: passwordController,
                decoration: textInputDecoration.copyWith(labelText: 'Password', hintText: 'password'),
                // masquage du mot de passe lors de la frappe
                obscureText: true,
                validator: (value) => value.length < 8 ? "Please enter a securized password of more than 8 characters" : null,
                //                 validator: (value) => value!.length < 8 ? "Please enter a securized password of more than 8 characters" : null,
              ),
              SizedBox(height: 10.0),

              //BOUTON DE CONNEXION
              ElevatedButton(
                  //child: Text('Log In'),
                  child: Text(
                      showSignIn ? "Sign In" : "Log In",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      //if(_formKey.currentState!.validate()){
                      setState(() => loading = true);
                      var password = passwordController.value.text;
                      var mail = nameController.value.text;
                          // Probleme name vs mail


                      // dynamic result = await _auth.signInWithMailAndPassword(mail, password);
                      // _auth.signInWithMailAndPassword(mail, password);

                      dynamic result = showSignIn
                      ? await _auth.signInWithMailAndPassword(mail, password)
                      : await _auth.registerInWithMailAndPassword(mail, password);

                      // To do name
                      if(result == null){
                        setState((){
                          loading = false;
                          error = 'Wrong credentials';
                          print(error);
                        });
                      }
                    }
                  },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red)
              )
            ],
          ),
        ),
      ),
    );
  }
}