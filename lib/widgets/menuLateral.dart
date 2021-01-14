import 'package:flutter/material.dart';
import 'package:mercado/tabs/productTab.dart';
import '../models/userModel.dart';
import '../screens/login.dart';
import '../tiles/drawerTile.dart';
import 'package:scoped_model/scoped_model.dart';

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
              ScopedModelDescendant<Usermodel>(
                  builder: (context, child, model) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      child: Text(
                        !model.isLoggedIn() ? "Entre ou cadastre-se >" : "Sair",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        if (!model.isLoggedIn())
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()));
                        else
                          model.signOut();
                      },
                    ),
                  ],
                );
              }),
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
