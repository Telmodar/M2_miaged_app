import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/common/constants.dart';
import 'package:miaged_app/services/authentication.dart';





class ProfilePage extends StatelessWidget{


  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  DateTime birthdate;
  final addressController = TextEditingController();
  final zipCodeController = TextEditingController();
  final cityController = TextEditingController();

final AuthenticationService _auth = AuthenticationService();


// PAGE DE PROFIL AVEC INFORMATION EN DUR 
//        Todo :
// - Récupérer les informations de Firebase 
// - Upload les informations à firebase


@override
Widget build(BuildContext context) {
  return Scaffold(
    
    body: Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      child: Form(
        child: Column(
      children: [
        TextFormField(
          controller: mailController,
          decoration: textInputDecoration.copyWith(labelText: 'Mail', hintText: 'mail'),
          enableInteractiveSelection: false,
          focusNode: new ReadOnly(),

        ),
          Container(width:0.0, height:0.0),
          SizedBox(height: 10.0,),

        TextFormField(
          controller: passwordController,
          decoration: textInputDecoration.copyWith(labelText: 'Password', hintText: 'password'),
        ),
          Container(width:0.0, height:0.0),
          SizedBox(height: 10.0,),

        TextFormField(
          controller: nameController,
          decoration: textInputDecoration.copyWith(labelText: 'Name', hintText: 'name'),
        ),
          Container(width:0.0, height:0.0),
          SizedBox(height: 10.0,),  

        Text('Brithdate : '),
        Text(birthdate.toString()),
        RaisedButton(
          child: Text('Birthdate'),
          onPressed: () {
            showDatePicker(
              context: context, 
              initialDate: DateTime(1900), 
              firstDate: DateTime(1900), 
              lastDate: DateTime(2021)
              ).then((date) {} );
          } 
          ),
        
      TextFormField(
          controller: addressController,
          decoration: textInputDecoration.copyWith(labelText: 'Address', hintText: 'ex : 1645 Rte des Lucioles'),
        ),
          Container(width:0.0, height:0.0),
          SizedBox(height: 10.0,),   


      TextField(
          controller: zipCodeController,
          decoration: textInputDecoration.copyWith(labelText: 'ZIP Code', hintText: 'ex : 06410'),
          keyboardType: TextInputType.number,

        ),
          Container(width:0.0, height:0.0),
          SizedBox(height: 10.0,),       

      TextFormField(
          controller: cityController,
          decoration: textInputDecoration.copyWith(labelText: 'City', hintText: 'ex : Biot'),
        ),
          Container(width:0.0, height:0.0),
          SizedBox(height: 10.0,),   


      RaisedButton(
            onPressed: () async {
              await _auth.signOut();
            },
            color: Colors.red,
            child: Text('Log Out', style: TextStyle(color: Colors.white70)),
         
            ),


      RaisedButton(
        // Todo, valider les données et les envoyés à Firebase
            onPressed: () async {},
            color: Colors.blueAccent,
            child: Text('Valid', style: TextStyle(color: Colors.white70)),
         
            ),
         
      ],
    ),
    ),
    )
  )
  ;
}
}



class ReadOnly extends FocusNode {
  @override
  bool get hasFocus => false;
}
