import 'package:flowers_shop_r/pages/item_catalog_page.dart';
import 'package:flutter/material.dart';

class CatalogListTile extends StatelessWidget {
  final imgUrl;

  CatalogListTile({Key? key, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ///навигация на страницу каталога
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ItemCatalogPage(imgUrl: imgUrl,),));
      },
      child: Container(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text('Товары со скидкой'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('01.08.2022 - 31.08.2022'),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.amber,
                    ),
                    Text('4,9'),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
