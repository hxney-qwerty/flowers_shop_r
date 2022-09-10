import 'dart:collection';

import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final num price;
  final String imgUrl;
  final color;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imgUrl,
      @required this.color});
}

class ProductDataProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Нежные пионы',
      description:
          'Композиция «Нежные пионы», состоящая из  пыльно-розовых пионов – это букет-признание. Бело-розовая гамма наполняет '
          'его нежностью, чистотой, невинностью, и в то же время говорит о любви и чувственных желаниях дарителя.',
      price: 1500.00,
      imgUrl: 'https://oir.mobi/uploads/posts/2021-04/1618620964_3-oir_mobi-p-nezhnii-buket-pionov-tsveti-krasivo-foto-3.jpg',
      color: '0xFFC5CAE9',
    ),
    Product(
      id: 'p2',
      title: '77 алых роз',
      description:
      'Цветок страсти и любви невозможно оставить без внимания. Букеты из таких роз выбирают для признания в любви, верности,'
          ' в качестве подарка мамам, учителям, бабушкам и даже коллегам. Это универсальное растение, которое будет уместно всюду. '
          'Наши специалисты грамотно подбирают растения при составлении чарующих шедевров. Кустовые розы и сортовые цветы с ножками различной'
          ' длины, бутоны различных размеров и многообразие оттенков красного – это лишь начало для фантазий наших флористов, которые воплощаются'
          ' в прекрасных творениях.',
      price: 3490.00,
      imgUrl: 'https://polerose.ru/media/cache/75/1e/751e60c6e11bb6728d669cdf79ff6c46.webp',
      color: '0xFFB39DDB',
    ),
    Product(
      id: 'p3',
      title: 'Букет из 5 хризантем',
      description:
      'Пышность, воздушная легкость, пьянящий аромат и очарование – именно такое описание можно дать растению,'
          ' которое дарит нам осенняя пора. Используя его также можно создавать невероятно красивые оригинальные композиции,'
          ' что успешно делают наши специалисты. Мы предлагаем хризантемы разной фактуры и цветовых гамм, благодаря которым '
          'можно получать фантастические букеты, вызывающие невероятные эмоции.',
      price: 2490.00,
      imgUrl: 'https://shop.perm-buket.ru/components/com_jshopping/files/img_products/298d2779359d9f8b4e776b66b615c389.jpg',
      color: '0xFFC5CAE9',
    ),
    Product(
      id: 'p4',
      title: 'Съедобный',
      description:
      'Романтичный, красивый букет из отборной клубники с белыми кустовыми розами. '
          'Букет, который произведет громкий успех, покорит не только получателя букета, но и окружающих.',
      price: 4490.00,
      imgUrl: 'https://roselepestki.ru/wp-content/uploads/2018/09/kurtuaznyj-poceluj.jpg',
      color: '0xFFB39DDB',
    ),
    Product(
      id: 'p5',
      title: '7 Гортензий',
      description:
      'Гортензии — это очень яркие цветы, поэтому композиции с ними получаются выразительными, запоминающимися.'
          ' Посмотрите на разнообразие цвета. Гортензии вы сможете найти и в голубом стиле, и в желтом и множество других цветов.',
      price: 5000.00,
      imgUrl: 'https://fl-er.ru/wp-content/uploads/2019/03/buket-iz-gortenzii-art-14-131-1.png',
      color: '0xFFC5CAE9',
    ),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  getElementById(String id) => _items.singleWhere((value) => value.id == id);
}
