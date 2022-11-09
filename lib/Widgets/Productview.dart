import 'package:flutter/material.dart';
import '../Screens/Product_DetailScreen.dart';
class productview extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;



  productview(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {

    void productdetailscreen(){
      Navigator.of(context).pushNamed('/ProductDetailScreen', arguments: id);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            icon: Icon(Icons.favorite, color: Theme.of(context).accentColor),
            onPressed: () {},
          ),
          title: Text(
            title,
           //textAlign: TextAlign.center,
            //style: Theme.of(context).textTheme.subtitle1,
          ),
          trailing: IconButton(
            icon:
                Icon(Icons.shopping_cart, color: Theme.of(context).accentColor),
            onPressed: () {},
          ),
        ),
        child: GestureDetector(
          onTap: ()=> productdetailscreen(),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
