import 'package:flutter/cupertino.dart';

enum Category { all, accessories, clothing, home }

class Product {
  final int id;
  final Category category;
  final bool isFeatured;
  final String name;
  final int price;

  //Product(this.id, this.category, this.isFeatured, this.name, this.price);
  const Product(
      {@required this.id,
      @required this.category,
      @required this.isFeatured,
      @required this.name,
      @required this.price})
      : assert(id != null),
        assert(category != null),
        assert(isFeatured != null),
        assert(name != null),
        assert(price != null);

  String get assetName => '$id-0.jpg' ;
  String get assetPackage => 'shrine_images';
  @override
  String toString() => '$name (id=$id)' ;
}
