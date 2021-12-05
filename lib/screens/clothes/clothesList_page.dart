import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miaged_app/models/mock_clothe.dart';
import 'package:miaged_app/services/database.dart';
import 'package:provider/provider.dart';

import 'clothe_list.dart';

class ClothesListPage extends StatelessWidget {

var user = FirebaseAuth.instance.currentUser;

List clotheList = <Clothe>[];



FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;

Future<bool> clothesListPage() async {
    await firestoreInstance.collection("clothes").get().then((querySnapshot) {
      if (clotheList.length > 0) {
        clotheList.clear();
      }
      querySnapshot.docs.forEach((result) {
        clotheList.add(Clothe(

            result.get("cat").toString(),
            result.get("size").toString(),
            result.get("title").toString(),
            result.get("img").toString(),
            result.get("brand").toString(),
            result.get("price") * 1.00,
            ),
            );
            log(result.get("cat").toString(),);
            log(result.get("size").toString(),);
            log(result.get("title").toString(),);
            log(result.get("img").toString(),);
            log(result.get("brand").toString(),);
            // log(result.get("price") * 1.0).toString();
      });
      //log(_cloth.toString());
    });

    log(clotheList.toString());
    return true;
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: clothesListPage(),
        builder: (context, snapshot) {
          

    
    
    Widget buildListWidget =  buildList();

    log('#########################');
log(buildListWidget.toString());


    return  Scaffold(
          // To Do, appeler la ClotheList avant le buildListWidget pour afficher les chiffres 
          // body: ClotheList(
              
            body: buildListWidget
      
    );
  }
  
  );

Widget buildItem(Clothe c) {
    return Container(
      child: ListTile(
        title: Text(c.title),
        subtitle: Text("Size : " +
            c.size +
            " \n" +
            c.brand +
            "\n" +
            c.price.toString() /*.toStringAsFixed(2)*/ +
            " € "),
        isThreeLine: true,
        leading: Image(
          alignment: Alignment.center,
          image: NetworkImage(c.img),
          height: 600,
          width: 60,
          
        ),
        
      ),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
          
    );
    
  }



  Widget buildList () {
    List<Widget> cards = <Widget>[];
    double i = 0;
    // cards.add(title());
    clotheList.forEach((element) {
      cards.add(buildItem(element));
      i++;
      log(i.toString());
      log(element.toString());
    }); 
  return ListView(
      children: cards,
    );


  }



}







