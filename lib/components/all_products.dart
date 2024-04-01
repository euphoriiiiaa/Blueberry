import 'package:blueberry/components/product_item.dart';
import 'package:blueberry/models/product_model.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: products.length,
          (context, index) {
        return ProductItem(
          productArticle: products[index].productArticle,
          productUrlImage: products[index].productUrlImage,
          productName: products[index].productName,
          productCost: products[index].productCost,
          typeProductId: products[index].typeProductId,
          warehouseId: products[index].warehouseId,
        );
      }),
    );
  }
}