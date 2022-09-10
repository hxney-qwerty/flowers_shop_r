import 'package:flowers_shop_r/models/Cart.dart';
import 'package:flowers_shop_r/pages/cart_page.dart';
import 'package:flowers_shop_r/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);
    final cartItems = cartData.cartItems;

    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 + 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cartItems.length,
                itemBuilder: (context, index) => Hero(
                  tag: cartItems.values.toList()[index].imgUrl,
                  child: GestureDetector(
                    onTap: () {
                      ///навигация на страницу товара-букета
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ItemPage(productId: cartItems.keys.toList()[index],
                      ),),
                      );
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 35,
                          height: 35,
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 4.0,
                                spreadRadius: 5.0,
                                offset: Offset(-2, 2),
                              )
                            ],
                            image: DecorationImage(
                              image: NetworkImage(
                                  cartItems.values.toList()[index].imgUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 5,
                          child: Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.black,
                            ),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              maxHeight: 16,
                            ),
                            child: Text(
                              '${cartItems.values.toList()[index].number}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2 - 50.0,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(cartData.totalAmount.toStringAsFixed(2)),
                  IconButton(
                    onPressed: () {
                      ///навигация перейти в корзину
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CartPage(),
                      ));
                    },
                    icon: Icon(
                      Icons.shopping_basket,
                      color: Color(0xFFC5CAE9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
