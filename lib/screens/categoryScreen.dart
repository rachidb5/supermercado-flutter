import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mercado/widgets/cartButton.dart';
import '../datas/productData.dart';
import '../tiles/productTile.dart';
//import '../widgets/menuLateralProdutos.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryScreen(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.data["title"]),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.blue,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.grid_on),
              ),
              Tab(
                icon: Icon(Icons.list),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Row(),
            Expanded(
              child: FutureBuilder<QuerySnapshot>(
                  future: Firestore.instance
                      .collection("products")
                      .document(snapshot.documentID)
                      .collection("itens")
                      .getDocuments(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    else
                      return TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            GridView.builder(
                                padding: EdgeInsets.all(4.0),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 4.0,
                                  crossAxisSpacing: 4.0,
                                  childAspectRatio: 0.65,
                                ),
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  ProductData data = ProductData.fromDocument(
                                      snapshot.data.documents[index]);
                                  data.category = this.snapshot.documentID;
                                  return ProductTile("grid", data);
                                }),
                            ListView.builder(
                                padding: EdgeInsets.all(4.0),
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  ProductData data = ProductData.fromDocument(
                                      snapshot.data.documents[index]);
                                  data.category = this.snapshot.documentID;
                                  return ProductTile("list", data);
                                })
                          ]);
                  }),
            ),
          ],
        ),
        floatingActionButton: CartButton(),
      ),
    );
  }
}
