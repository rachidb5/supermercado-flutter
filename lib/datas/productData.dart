import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  String category;
  String id;

  String title;
  String description;

  double price;

  String images;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"] + 0.0;
    images = snapshot.data["image"];
  }

  Map<String, dynamic> toResumedMap() {
    return {"title": title, "description": description, "price": price};
  }
}
