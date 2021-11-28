import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/models/mock_basket_product.dart';
import 'package:miaged_app/models/mock_clothe.dart';
import 'package:miaged_app/services/database.dart';

class ClotheDetailPage extends StatelessWidget {
  const ClotheDetailPage({Key key, this.clothe}) : super(key: key);
  //  const ClotheDetailPage({Key? key, required this.clothe}) : super(key: key);

  final Clothe clothe;

  @override
  Widget build(BuildContext context) {
    final DatabaseService _database = DatabaseService('htjTZXVcH3QUIvxsNojBX1QXQkJ2',clothe.uid);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        title: Text('Détail du produit'),
        actions: <Widget>[
          StreamBuilder<BasketProduct>(
            stream: _database.basketProduct,
            builder: (context, snapshot){
              if(snapshot.hasData){
                BasketProduct basketProduct = snapshot.data;
                //BasketProduct? basketProduct = snapshot.data;
                return TextButton.icon(
                  icon: Icon(Icons.shopping_basket),
                  label: Text('+panier'),
                  onPressed: () async{
                    basketProduct.quantite++;
                    //basketProduct!.quantite++;
                    await _database.updateProduct(basketProduct);
                    //await _database.updateProduct(basketProduct!);
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                );
              } else{
                return TextButton.icon(
                  icon: Icon(Icons.shopping_basket),
                  label: Text('+panier'),
                  onPressed: () async{
                    await _database.updateProduct(BasketProduct(clothe.uid,clothe.titre,clothe.taille,clothe.image,clothe.prix,1));
                  },
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                );
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Text(
               clothe.titre,
               style: TextStyle(
                fontWeight: FontWeight.bold,
                 fontSize: 20.0
               ),
            ),
            Center(
                child: Image(
                  image: NetworkImage(clothe.image),
                )
            ),
            Text('Size :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                clothe.taille
            ),
            Text('Brand :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                clothe.marque
            ),
            Text('Cat :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                clothe.categorie
            ),
            Text('Price :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                clothe.prix.toString()+' €'
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      )
    );
  }
}
