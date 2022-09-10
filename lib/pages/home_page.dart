import 'package:flowers_shop_r/models/Product.dart';
import 'package:flowers_shop_r/widgets/bottom_bar.dart';
import 'package:flowers_shop_r/widgets/catalog.dart';
import 'package:flowers_shop_r/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);


    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 85,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              )),
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              Container(
                child: const ListTile(
                  title: Text(
                    'Летние букеты',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Букеты на все случаи жизни',
                      style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.panorama_horizontal),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                height: 290,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productData.items.length,
                    itemBuilder: (context, int index) =>
                        //43:24
                        ChangeNotifierProvider.value(
                          value: productData.items[index],
                          child: ItemCard(),
                        )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('католог букетов'),
              ),

              ...productData.items.map((value) {
                return CatalogListTile(imgUrl: value.imgUrl);
              }).toList(),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
