import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/categoryScreen.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoryScreen(snapshot)));
          },
          child: Container(
            height: 60.0,
            child: Row(
              children: [
                Icon(
                  Icons.arrow_forward_sharp,
                  size: 32.0,
                  color: Colors.orange,
                ),
                SizedBox(
                  width: 32.0,
                ),
                Text(
                  snapshot.data["title"],
                  style: TextStyle(fontSize: 16),
                )
              ],
              // title: Text(snapshot.data["title"]),
              // trailing: Icon(Icons.keyboard_arrow_right),
            ),
          ),
        ));
  }
}
