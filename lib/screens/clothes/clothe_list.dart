import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/models/mock_clothe.dart';
import 'package:miaged_app/screens/clothes/clothe_detail_page.dart';
import 'package:provider/provider.dart';

class ClotheList extends StatefulWidget {

  @override
  _ClotheFilter createState() => _ClotheFilter();
}

class _ClotheFilter extends State<ClotheList> {

  String filter = 'All filters';

// MENU DES FILTRES 
// To do : 
// - changer en tab bar

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
                    filter = value.toString();
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
                    child: Text("Underware"),
                    value: "Underware",
                  ),
                  PopupMenuItem(
                    child: Text("Bags"),
                    value: "Bags",
                  ),
                  PopupMenuItem(
                    child: Text("Dresses"),
                    value: "Dresses",
                  ),
                  PopupMenuItem(
                    child: Text("For moms"),
                    value: "For moms",
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
            Text(filter),
          ],
        ),

        
      ],
    );
  }
}



/*


Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.)),
                
              ],
            ),
            title: const Text('Tabs'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.),
              
            ],
          ),
        ),
      ),
    );
  }
}
*/