
import 'package:flutter/material.dart';

class UserProductView extends StatelessWidget {
  final String imageUrl;
  final String productId;
  final String productTitle;

  UserProductView(
      {required this.imageUrl,
      required this.productId,
      required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(
          productTitle,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                },
                icon: Icon(Icons.edit, color: Theme.of(context).accentColor),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
