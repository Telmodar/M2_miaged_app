import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:miaged_app/models/mock_clothe.dart';
import 'package:miaged_app/services/database.dart';




class ClotheList extends StatefulWidget {

  @override
  _ClotheListState createState() => _ClotheListState();
}

class _ClotheListState extends State<ClotheList> {
  @override
  Widget build(BuildContext context) {
    final clothes = Provider.of<List<Clothe>>(context) ?? [];

    return ListView.builder(
        itemCount: clothes.length,
        itemBuilder: (context, index){
          return ClotheTile(clothes[index]);
    }
    );
  }
}

class ClotheTile extends StatelessWidget{
  final Clothe clothe;
  ClotheTile(this.clothe);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.only(top:12.0, bottom:6.0, left: 20.0, right: 20.0),
        child: ListTile(
          title: Text(clothe.cat),
            subtitle: Text(clothe.size),
        )
      )
    );
  }
}


