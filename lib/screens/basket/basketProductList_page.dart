import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/models/mock_basket_product.dart';
import 'package:miaged_app/services/database.dart';
import 'package:provider/provider.dart';

class BasketProductListPage extends StatelessWidget {
  String imgUrl = "";

  @override
  Widget build(BuildContext context) {

    // ECOUTE DES PRODUITS SELECTIONNES
    return StreamProvider<Iterable<BasketProduct>>.value(
      value: DatabaseService('', '').basket,
      initialData: [],
      child: Scaffold(
        body:
            //
            //BasketProductList()
            //


            // VALEURS EN DUR
            ListTile(
          leading: Image(
              image: NetworkImage(
                  'https://m.media-amazon.com/images/I/A10jHpEjz5L._AC_UY445_.jpg')),
          trailing: Icon(Icons.cancel_rounded,),
          title: Text("Kilt de cérémonie"),
          subtitle: Column(
            children:
          <Widget>[
            Text("200 €", textAlign: TextAlign.left,), 
            Text("Size : L", textAlign: TextAlign.left,)
            ]
            ),
          isThreeLine: true,
        ),

          
      ),
    );
  }
}


//CLASS POUR AFFICHER UNE LISTE DE TILES
class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: ListTile.divideTiles(context: context, tiles: [
        BasketProductListPage(),
        BasketProductListPage(),
        BasketProductListPage(),
      ]),
    );
  }
}
