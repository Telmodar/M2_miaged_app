import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/models/mock_basket_product.dart';
import 'package:miaged_app/services/database.dart';
import 'package:provider/provider.dart';

import 'basketProductList.dart';

class BasketProductListPage extends StatelessWidget {
  const BasketProductListPage({Key key}) : super(key: key);
  //  const BasketProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Iterable<BasketProduct>>.value(
      value: DatabaseService('htjTZXVcH3QUIvxsNojBX1QXQkJ2','').basket,
      initialData: [],
      child: Scaffold(
          body: BasketProductList()
      ),
    );
  }
}