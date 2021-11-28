import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/models/mock_clothe.dart';
import 'package:miaged_app/services/database.dart';
import 'package:provider/provider.dart';

import 'clothe_list.dart';

class ClothesListPage extends StatelessWidget {
  const ClothesListPage({Key key}) : super(key: key);
  //const ClothesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Iterable<Clothe>>.value(
      value: DatabaseService('htjTZXVcH3QUIvxsNojBX1QXQkJ2','').clothes,
      initialData: [],
      child: Scaffold(
          body: ClotheList()
      ),
    );
  }
}
