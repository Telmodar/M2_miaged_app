import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/models/mock_basket_product.dart';
import 'package:miaged_app/models/mock_clothe.dart';
import 'package:miaged_app/services/database.dart';

// PAGE D'AFFICHAGE DES DETAILS DE CLOTHE

class ClotheDetailPage extends StatelessWidget {
  const ClotheDetailPage({Key key, this.clothe}) : super(key: key);

  final Clothe clothe;

  @override
  Widget build(BuildContext context) {
    final DatabaseService _database = DatabaseService('',clothe.brand);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        title: Text('Product detail'),
        actions: <Widget>[
          StreamBuilder<BasketProduct>(
            stream: _database.basketProduct,
            builder: (context, snapshot){
              if(snapshot.hasData){
                BasketProduct basketProduct = snapshot.data;
                //BasketProduct? basketProduct = snapshot.data;
                return 
                TextButton.icon(
                  icon: Icon(Icons.shopping_basket_outlined),
                  label: Text(''),
                  onPressed: () async{
                    basketProduct.qte++;

                    await _database.updateProduct(basketProduct);
                    // voir https://www.youtube.com/watch?v=8oV4hC10OHY;
                  },
                  // Todo : add le style
                  style: ButtonStyle()
                  ,
                );
              } 
              else
              {
                return TextButton.icon(
                  icon: Icon(Icons.shopping_basket),
                  label: Text('Added in your basket <3'),
                  onPressed: () async{
                    // Todo : await _database.updateProduct();
                  },
                  
                   // Todo : add le style
                  style: ButtonStyle()
                );
              }
            },
          )
        ],
      ),
      
      // AFFICHAGE DU DETAIL DU CLOTHE
      body: SingleChildScrollView(
        child: Column(
          children: [
             Text(
               clothe.title,
               style: TextStyle(
               ),
            ),
            Text('Size :',
              style: TextStyle(
                
              ),
            ),
            Text(
                clothe.size
            ),
            Text('Brand :',
              style: TextStyle(
              ),
            ),
            Text(
                clothe.brand
            ),
            Text('Cat :',
              style: TextStyle(
              ),
            ),
            Text(
                clothe.cat
            ),
            Text('Price :',
              style: TextStyle(
              ),
            ),
            Text(
                clothe.price.toString()+' €'
            )
          ],
        ),
      )
    );
  }
}
