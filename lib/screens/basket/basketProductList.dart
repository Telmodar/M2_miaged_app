import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/models/mock_basket_product.dart';
import 'package:miaged_app/services/database.dart';
import 'package:provider/provider.dart';

class BasketProductList extends StatefulWidget {
  const BasketProductList({Key key}) : super(key: key);
  // const BasketProductList({Key? key}) : super(key: key);


  @override
  _BasketProductListState createState() => _BasketProductListState();
}

class _BasketProductListState extends State<BasketProductList> {
  @override
  Widget build(BuildContext context) {
    final basket = Provider.of<Iterable<BasketProduct>>(context) ?? [];
    if(basket.length==0){
      return Center(
        child: Text('Aucun porduit dans le panier'),
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
            child: Text('Prix : '+_calculPrix(basket)+'€'),
          )
        ],
      );
    }
  }

  String _calculPrix(Iterable<BasketProduct> basket){
    double prix = 0.0;
    basket.forEach((element) {
      prix+=element.prix*element.quantite;
    });
    return double.parse(prix.toStringAsFixed(2)).toString();
  }
}

class BasketProductTile extends StatelessWidget{
  final BasketProduct product;

  BasketProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child:Card(
            margin: EdgeInsets.only(top: 12.0,bottom: 6.0,left: 20.0,right: 20.0),
            child: Column(
              children:[
                Text(product.clothe),
                Image(
                  image: NetworkImage(product.img),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text('Taille : ${product.size}'),
                        Text('Prix : ${product.prix}'),
                        Text('Quantité : ${product.quantite}'),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    TextButton.icon(
                        onPressed: () async{
                          product.quantite--;
                          if(product.quantite==0)
                            await DatabaseService('htjTZXVcH3QUIvxsNojBX1QXQkJ2',product.uid).removeFromBasket();
                          else
                            await DatabaseService('htjTZXVcH3QUIvxsNojBX1QXQkJ2',product.uid).updateProduct(product);
                        }, 
                        icon: Icon(Icons.exposure_minus_1),
                        label: Text('')
                    )
                  ],
                ),
            ]
        ),
      ),
    );
  }
}
