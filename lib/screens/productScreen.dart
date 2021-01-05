import 'package:flutter/material.dart';
import '../datas/productData.dart';

class ProductScreen extends StatefulWidget {
  final ProductData product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;

  _ProductScreenState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product.title),
          centerTitle: true,
        ),
        body: ListView(children: [
          AspectRatio(
            aspectRatio: 1.3,
            child: Image.network(
              product.images,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
              padding: EdgeInsets.all(26.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                      maxLines: 3,
                    ),
                    Text("R\$ ${product.price.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 4, 125, 141))),
                    SizedBox(height: 16.0),
                    SizedBox(
                      height: 44.0,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'adicionar ao carrinho',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        color: Color.fromARGB(255, 4, 125, 141),
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Descrição",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      product.description,
                      style: TextStyle(fontSize: 16.0),
                    )
                  ]))
        ]));
  }
}
