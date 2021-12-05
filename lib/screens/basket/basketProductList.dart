import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/models/mock_basket_product.dart';
import 'package:provider/provider.dart';

//

class BasketProductList extends StatefulWidget {
  const BasketProductList({Key key}) : super(key: key);


  @override
  _BasketProductListState createState() => _BasketProductListState();
}


// AFFICHAGE DE TOUS LEES PRODUITS DANS LE BASKET 

class _BasketProductListState extends State<BasketProductList> {
  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<Iterable<BasketProduct>>(context) ?? [];
    // Probleme avec le provider 
    if(basket.length==0){
      return Center(
        child: Text('No product in your basket'),
      );
    }
    else{
      return ListView(
        children: <Widget>[
          ListView.builder(
            itemCount:basket.length,
            itemBuilder:(context, index) {
              return BasketProductTile(basket.elementAt(index));
            },
            shrinkWrap: true,
            physics: ScrollPhysics(),
          ),
          Container(
            child: Text('Price '+_sum(basket)+'€'),
          )
        ],
      );
    }
  }


  // CALCUL DE LA SOMMME DES PRODUITS DANS LE BASKET
  String _sum(Iterable<BasketProduct> basket){
    double prix = 0.0;
    basket.forEach((element) {
      prix+=element.price*element.qte;
    });
    return double.parse(prix.toStringAsFixed(2)).toString();
  }
}

// BLOCK DE CHAQUE PRODUITS  
class BasketProductTile extends StatelessWidget{
  final BasketProduct product;

  BasketProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      
                    );
              
    
  
  }
}
