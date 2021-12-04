import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miaged_app/models/mock_basket_product.dart';
import 'package:miaged_app/models/mock_clothe.dart';
import 'package:miaged_app/models/mock_user.dart';
// import 'package:miaged_app/services/authentication.dart';




class DatabaseService {
  final String uid;
  final String uidProduct;



  DatabaseService(this.uid, this.uidProduct);

  // final databaseReference  = FirebaseFirestore.instance;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference clothesCollection = FirebaseFirestore.instance.collection('clothes');
  final CollectionReference basketCollection = FirebaseFirestore.instance.collection('basket');

  Future<void> saveUser(
      String login,
      String password,
      DateTime bdate,
      String address,
      String zipCode,
      String city)

  async {
    Timestamp birthdate =  Timestamp.fromDate(bdate);

    return await usersCollection.doc(uid).set({
      'login':login,
      'password':password,
      'birthday':birthdate,
      'address':address,
      'zipCode':zipCode,
      'city':city
    });
  }

  AppUserData _userFromSnapshot(DocumentSnapshot snapshot){

    var temp = snapshot.data() as Map;
    DateTime birthday = temp['birthdate'].toDate();
    var login = temp['login'];
    var password = temp['password'];
    var address = temp['address'];
    var zipCode = temp['zipCode'];
    var city = temp['city'];
    return AppUserData(
        uid,
        login,
        password,
        birthday,
        address,
        zipCode,
        city,

        //DateTime birthday = snapshot.data()['birthdate'].toDate();
        // final name = temp['login'].toString(),
        // snapshot.data()['login'],
        // snapshot.data()['password']
        // snapshot.data()['address'],
        // snapshot.data()['zipCode'],
        // snapshot.data()['city']
    );
  }
  
  Stream<AppUserData> get user {
    return usersCollection
        .doc(uid)
        .snapshots()
        .map(_userFromSnapshot);
  }

  Clothe _clotheFromSnapshot(DocumentSnapshot snapshot){
    var temp = snapshot.data() as Map;
    var cat = temp['cat'];
    var size = temp['size'];
    var title = temp['title'];
    var picture = temp['picture'];
    var brand = temp['brand'];
    var price = temp['price'];


    return Clothe(snapshot.id,
        cat,
        size,
        title,
        picture,
        brand,
        price,
    );
  }

  List<Clothe> _clotheListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
        return _clotheFromSnapshot(doc);
      }
    );
  }

  Stream<List<Clothe>> get clothes {
    return clothesCollection
        .snapshots()
        .map(_clotheListFromSnapshot);
  }

  Future<void> updateProduct(BasketProduct basketProduct) async{
    return await basketCollection.doc(uidProduct).set({
      'produit':basketProduct.clothe,
      'img':basketProduct.img,
      'size':basketProduct.size,
      'price':basketProduct.prix,
      'quantity':basketProduct.quantite

    });
  }

  Future<void> removeFromBasket() async{
    basketCollection.doc(uidProduct).delete();
  }

  BasketProduct _basketProductFromSnapshot(DocumentSnapshot snapshot){
    var temp = snapshot.data() as Map;
    var product = temp['product'];
    var size = temp['size'];
    var picture = temp['picture'];
    var price = temp['price'];
    var quantity = temp['quantity'];

    return BasketProduct(snapshot.id,
       product,
       size,
       picture,
       price,
       quantity,
    );
  }

  Stream<BasketProduct> get basketProduct{
    return basketCollection.doc(uidProduct).snapshots().map(_basketProductFromSnapshot);
  }



  Iterable<BasketProduct> _basketProductListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map( (doc){
      return _basketProductFromSnapshot(doc);
    });
  }

  Stream<Iterable<BasketProduct>> get basket{
    return basketCollection.snapshots().map(_basketProductListFromSnapshot);
  }
}