import 'package:flutter/material.dart';
import 'package:mercado/tabs/productTab.dart';
//import '../models/user_model.dart';
import '../screens/loginScreen.dart';
import '../tiles/drawerTile.dart';
//import 'package:scoped_model/scoped_model.dart';

class MenuLateral extends StatelessWidget {
  final PageController pageController;

  MenuLateral(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 100.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "Mercantil",
                        style: TextStyle(
                            fontSize: 34.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              //Divider(),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text('Cadaste-se ou faça login')),
              DrawerTile(Icons.list, "Produtos", pageController, 0),
              DrawerTile(Icons.location_on, "Lojas", pageController, 2),
              DrawerTile(
                  Icons.playlist_add_check, "Meus Pedidos", pageController, 3),
              SizedBox(
                height: 200,
                child: ProductsTab(),
              )
            ],
          )
        ],
      ),
    );
  }
}
