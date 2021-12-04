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

  final mailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  var showSignIn = true; // Final ???

  @override
  void dispose(){
    mailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void toggleView() {
    setState(() {
          _formKey.currentState.reset();
          error = '';
          mailController.text= '';
          nameController.text= '';
          passwordController.text = "";
          showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context){
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: Text(showSignIn
            ? 'Log In to Miaged'
            : 'Register to Miaged'),

        actions: <Widget>[
          TextButton.icon(
            icon:Icon(showSignIn
                ? Icons.add_circle
                : Icons.account_circle_rounded,
                color: Colors.black),
            label: Text(showSignIn
                ? 'Register'
                : 'Log In',
                style: TextStyle(color: Colors.black)),

            onPressed: () => toggleView(),
          )
        ],
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        child: Form(
          key:_formKey,
          child: Column(
            children: [
              // DEMANDE DE NOM A LA CREATION
              !showSignIn ?
              TextFormField(
                controller: nameController,
                decoration: textInputDecoration.copyWith(labelText: 'Name', hintText: 'name'),
                validator: (value) => value.isEmpty ? "What your name ?" : null,
              ) : Container(width:0.0, height:0.0),
              !showSignIn ? SizedBox(height: 10.0,) : null,

              // DEMANDE DE L'EMAIL
              TextFormField(
                controller: mailController,
                 decoration: textInputDecoration.copyWith(labelText: 'Mail', hintText: 'mail'),
                 validator: (value) => value.isEmpty ? "What your mail adress ?" : null,
              ),
              SizedBox(height: 10.0),

              //DEMANDE DU PASSWORD
              TextFormField(
                controller: passwordController,
                decoration: textInputDecoration.copyWith(labelText: 'Password', hintText: 'password'),
                // masquage du mot de passe lors de la frappe
                obscureText: true,
                validator: (value) => value.length < 6 ? "Please enter a securized password of more than 6 characters" : null,
                //                 validator: (value) => value!.length < 8 ? "Please enter a securized password of more than 8 characters" : null,
              ),
              SizedBox(height: 10.0),

              //BOUTON DE CONNEXION
              ElevatedButton(
                  //child: Text('Log In'),
                  child: Text(
                      showSignIn ? "Log In" : "Register",
                      style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      //if(_formKey.currentState!.validate()){
                      setState(() => loading = true);
                      var password = passwordController.value.text;
                      var mail = mailController.value.text;
                      var name = nameController.value.text;
                          // Probleme name vs mail


                      // dynamic result = await _auth.signInWithMailAndPassword(mail, password);
                      // _auth.signInWithMailAndPassword(mail, password);

                      dynamic result = showSignIn
                      ? await _auth.signInWithMailAndPassword(mail, password)
                      : await _auth.registerInWithMailAndPassword(name, mail, password);

                      if(result == null){
                        setState((){
                          loading = false;
                          error = 'Wrong credentials';
                          // print(error);
                        });
                      }
                    }
                  },
              ),
              SizedBox(height: 12.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red)
              ),
                LogoImageAsset()
            ],
          ),
        ),
      ),
    );
  }
}

class LogoImageAsset extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AssetImage logoAsset = AssetImage('assets/images/logo2.png');
    Image logo = Image(image: logoAsset, width: 400.0, height : 400.0);
    return Container(child: logo,);
  }

}