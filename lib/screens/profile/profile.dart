import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/common/constants.dart';
import 'package:miaged_app/common/loading.dart';
import 'package:miaged_app/models/mock_user.dart';
import 'package:miaged_app/services/authentication.dart';
import 'package:miaged_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key key}) : super(key: key);
  //const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileStateWidget createState() => _ProfileStateWidget();
}

class _ProfileStateWidget extends State {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUserData>(context);
    //    final user = Provider.of<AppUserData?>(context);
    initializeDateFormatting();
    if (user == null) {
      return Loading();
    } else {
      final DatabaseService _database = DatabaseService(user.uid,'');
      final AuthenticationService _auth = AuthenticationService();

      final passwordController = TextEditingController(text: user.password);
      final codePostalController = TextEditingController(text: user.codePostal);
      final addressController = TextEditingController(text: user.address);
      final cityController = TextEditingController(text: user.city);

      return SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 10.0),
          TextFormField(
            decoration: textInputDecoration.copyWith(labelText: 'Login'),
            initialValue: user.login,
            readOnly: true,
          ),
          SizedBox(height: 10.0),
          TextFormField(
            controller: passwordController,
            decoration: textInputDecoration.copyWith(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 10.0),
          TextButton(
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1900, 1, 1),
                  maxTime: DateTime(2021, 12, 12), onChanged: (date) {
                print('change $date');
              }, onConfirm: (date) {
                print('confirm $date');
                setState(() {
                  user.birthdate = date;
                });
              }, currentTime: user.birthdate, locale: LocaleType.fr);
            },
            child: Text(
              "Birthday : " + DateFormat.yMd('fr').format(user.birthdate),
              style: TextStyle(color: Colors.red),
            ),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            controller: addressController,
            decoration: textInputDecoration.copyWith(labelText: 'Address'),
          ),
          SizedBox(height: 10.0),
          TextFormField(
            controller: codePostalController,
            decoration: textInputDecoration.copyWith(labelText: 'codePostal'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10.0),
          TextFormField(
            controller: cityController,
            decoration: textInputDecoration.copyWith(labelText: 'city'),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            child: Text('Valider'),
            onPressed: () async {
              var password = passwordController.value.text;
              var address = addressController.value.text;
              var code = codePostalController.value.text;
              var city = cityController.value.text;

              await _auth.updatePassword(user.password,password);
              await _database.saveUser(user.login, password, user.birthdate, address, code, city);
            },
          ),
        ],
      ));
    }
  }
}
