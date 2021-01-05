//Pendencias:

//Cadastro com facebook e google
//IOS
//Responsividade
//Estilo

import 'package:flutter/material.dart';
import './screens/homeScreen.dart';
import 'package:scoped_model/scoped_model.dart';
import './models/userModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<Usermodel>(
      model: Usermodel(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Color.fromARGB(255, 4, 125, 141)),
          debugShowCheckedModeBanner: false,
          home: HomeScreen()),
    );
  }
}
