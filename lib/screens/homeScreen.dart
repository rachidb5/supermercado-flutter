import 'package:flutter/material.dart';
import '../tabs/productTab.dart';
import '../widgets/menuLateral.dart';
import '../widgets/cartButton.dart';
import '../tabs/ordersTab.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: MenuLateral(_pageController),
          body: ProductsTab(),
          floatingActionButton: CartButton(),
        ),
        Container(color: Colors.yellow),
        Scaffold(
          appBar: AppBar(
            title: Text("Meus Pedidos"),
            centerTitle: true,
          ),
          body: OrdersTab(),
          drawer: MenuLateral(_pageController),
        )
      ],
    );
  }
}
