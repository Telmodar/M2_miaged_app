import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/models/mock_clothe.dart';
import 'package:miaged_app/screens/clothes/clothe_detail_page.dart';
import 'package:provider/provider.dart';

class ClotheList extends StatefulWidget {
  const ClotheList({Key key}) : super(key: key);
  //  const ClotheList({Key? key}) : super(key: key);

  @override
  _ClotheListState createState() => _ClotheListState();
}

class _ClotheListState extends State<ClotheList> {

  String _filtre = 'All filters';

  @override
  Widget build(BuildContext context) {
    final clothes = Provider.of<Iterable<Clothe>>(context) ?? [];
    return ListView(
      children: [
        Row(
          children: [
            Text('Filter '),
            PopupMenuButton(
                onSelected: (value){
                  setState(() {
                    _filtre = value.toString();
                  });
                },
                itemBuilder:(context) => [
                  PopupMenuItem(
                    child: Text("All"),
                    value: "All",
                  ),
                  PopupMenuItem(
                    child: Text("Short"),
                    value: "Short",
                  ),
                  PopupMenuItem(
                    child: Text("Pants"),
                    value: "Pants",
                  ),
                  PopupMenuItem(
                    child: Text("Shirts"),
                    value: "Shirts",
                  ),
                  PopupMenuItem(
                    child: Text("Socks"),
                    value: "Socks",
                  ),
                  PopupMenuItem(
                    child: Text("T-shirts"),
                    value: "T-shirts",
                  )
                ]
            ),
            Text(_filtre),
          ],
        ),
        ListView.builder(
            itemCount:clothes.length,
            itemBuilder:(context, index){
              return ClotheTile(clothes.elementAt(index),_filtre);
            },
          shrinkWrap: true,
          physics: ScrollPhysics(),
        )
      ],
    );
  }
}

class ClotheTile extends StatelessWidget{
  final Clothe clothe;
  final String filtre;

  ClotheTile(this.clothe, this.filtre);

  @override
  Widget build(BuildContext context) {
    if(clothe.categorie==filtre || filtre=='Tous'){
      return Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: Card(
          margin: EdgeInsets.only(top: 12.0,bottom: 6.0,left: 20.0,right: 20.0),
          child: ListTile(
            leading: Text('Prix : ${clothe.prix}€ \nTaille : ${clothe.taille}'),
            title: Text(clothe.titre),
            subtitle: Container(
              child: Image(
                image: NetworkImage(clothe.image),
              ),
            ),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ClotheDetailPage(clothe: clothe))
              );
            },
          ),
        ),
      );
    }
    else{
      return Padding(padding:const EdgeInsets.only(top:0.0));
    }
  }

}
