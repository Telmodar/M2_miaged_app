import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:miaged_app/models/mock_clothe.dart';




class ClotheList extends StatefulWidget {

  @override
  _ClotheFilter createState() => _ClotheFilter();
}

class _ClotheFilter extends State<ClotheList> {
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
        margin: EdgeInsets.only(),
        child: ListTile(
          title: Text(""),
            subtitle: Text(""),
        )
      )
    );
  }
}


