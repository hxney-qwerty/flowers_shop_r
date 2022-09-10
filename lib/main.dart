import 'package:flowers_shop_r/models/Product.dart';
import 'package:flowers_shop_r/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/Cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
          create: (context) => ProductDataProvider(),
        ),
        ChangeNotifierProvider<CartDataProvider>(
          create: (context) => CartDataProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flowers Application',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          backgroundColor: Colors.white,
          textTheme: Theme
              .of(context)
              .textTheme,
        ),
        home: HomePage(),
      ),);
  }
}
