import 'mock_clothe.dart';

class BasketProduct{

  String uid;
  final String clothe;
  final String size;
  final String img;
  num prix;
  num quantite;

  BasketProduct(this.uid,this.clothe, this.size,  this.img, this.prix,this.quantite);
}