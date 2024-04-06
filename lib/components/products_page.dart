import 'package:blueberry/components/all_products.dart';
import 'package:blueberry/components/my_app_bar.dart';
import 'package:blueberry/components/popular_products.dart';
import 'package:blueberry/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const MyAppBar(),
        PopularProducts(products: widget.products),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              'Все товары',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffC2EFEB)),
            ),
          ),
        ),
        AllProducts(products: widget.products)
      ],
    );
  }
}