import 'package:ecommerce_app/providers/cart.dart';
import '../providers/Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class productview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    void productdetailscreen() {
      Navigator.of(context)
          .pushNamed('/ProductDetailScreen', arguments: product.id);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                  product.isfavorite
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: Theme.of(context).accentColor),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.title,
            //textAlign: TextAlign.center,
            //style: Theme.of(context).textTheme.subtitle1,
          ),
          trailing: IconButton(
            icon:
                Icon(Icons.shopping_cart, color: Theme.of(context).accentColor),
            onPressed: () =>
                cart.addCartItems(product.id, product.title, product.price),
          ),
        ),
        child: GestureDetector(
          onTap: () => productdetailscreen(),
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
