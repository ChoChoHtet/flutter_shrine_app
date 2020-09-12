import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_shrine/model/product.dart';
import 'package:flutter_shrine/model/products_repository.dart';
import 'package:flutter_shrine/supplemental/asymmetric_view.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  List<Card> _buildProductCard(BuildContext context) {
    List<Product> products = ProductRepository.loadProducts(Category.all);
    if (products == null || products.isEmpty) {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products
        .map((product) => Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AspectRatio(
                      aspectRatio: 18 / 11,
                      child: Image.asset(
                        product.assetName,
                        package: product.assetPackage,
                      )),
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                product == null ? '' : product.name,
                                style: theme.textTheme.button,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                product == null
                                    ? ''
                                    : formatter.format(product.price),
                                style: theme.textTheme.caption,
                              ),
                            ],
                          )))
                ],
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.menu,
                semanticLabel: 'menu',
              ),
              onPressed: () {
                print('Pressed Menu Button');
              }),
          title: Text('SHRINE'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search, semanticLabel: 'Search'),
                onPressed: () {
                  print('Pressed Search Button');
                }),
            IconButton(
                icon: Icon(Icons.tune, semanticLabel: 'Filter'),
                onPressed: () {
                  print('Pressed Filter Button');
                })
          ],
        ),
//      body: GridView.count(
//          crossAxisCount: 2,
//          padding: EdgeInsets.all(16),
//          childAspectRatio: 8 / 9,
//          children: _buildProductCard(context)),
//      resizeToAvoidBottomInset: false,
        body: AsymmetricView(
            products: ProductRepository.loadProducts(Category.all)));
  }
}
