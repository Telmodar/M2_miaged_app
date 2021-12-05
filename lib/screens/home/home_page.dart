import 'package:flutter/material.dart';
import 'package:miaged_app/screens/basket/basketProductList_page.dart';
import 'package:miaged_app/screens/clothes/clothesList_page.dart';
import 'package:miaged_app/screens/profile/profile_page.dart';
import 'package:miaged_app/services/authentication.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}


// Todo : 
// -  Utiliser le Stream<List<Clothe>> pour afficher les clothes 


class _HomePageState extends State {
  final AuthenticationService _auth = AuthenticationService();

  Widget page = ClothesListPage();
  int _selectedIndex = 0;
  Text title = Text('Clothes List', style: TextStyle(color: Colors.white70));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: title,
        actions: <Widget>[
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            label: Text('Log Out', style: TextStyle(color: Colors.white70)),
            icon: Icon(Icons.logout),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
            ),
          ),
        ],
      ),

      //
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
            icon: Icon(Icons.account_circle_rounded),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
    //)
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 1:
          {
            title = Text("Basket");
            page = BasketProductListPage();
            break;
          }
        case 2:
          {
            title = Text('Account');
            page = ProfilePage();
            break;
          }
        default:
          {
            title =
                Text('Clothes List', style: TextStyle(color: Colors.white70));
            page = ClothesListPage();
          }
      }
    });
  }

  // Widget streamProvider({Scaffold child}) {}

}
