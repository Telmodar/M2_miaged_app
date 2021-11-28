import 'package:flutter/material.dart';
import 'package:miaged_app/screens/basket/basketProductList_page.dart';
import 'package:miaged_app/screens/clothes/clothesList_page.dart';
import 'package:miaged_app/screens/profile/profile_page.dart';
import 'package:miaged_app/services/authentication.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState(){
    return _HomePageState();
  }

}

class _HomePageState extends State{

  final AuthenticationService _auth = AuthenticationService();
 
  Widget page = ClothesListPage();
  int _selectedIndex = 0;
  Text titre = Text('Clothes List');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: titre,
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            label: Text('Log Out'),
            icon: Icon(Icons.logout),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            ),
          ),
        ],
      ),
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shooping',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Basket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
      switch(index){
        case 1:{
          titre = Text("Basket");
          page = BasketProductListPage();
          break;
        }
        case 2:{
          titre = Text('Account');
          page = ProfilePage();
          break;
        }
        default:{
          titre = Text('Clothes List');
          page = ClothesListPage();
        }
      }
    });
  }

}
