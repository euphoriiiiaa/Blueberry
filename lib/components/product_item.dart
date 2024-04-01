import 'package:blueberry/screens/product_page.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String productUrlImage;
  final String productName;
  final double productCost;
  final int typeProductId;
  final int warehouseId;
  final String productArticle;
  const ProductItem(
      {super.key,
      required this.productUrlImage,
      required this.productName,
      required this.productCost,
      required this.typeProductId,
      required this.warehouseId,
      required this.productArticle});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 128, 231, 223),
                        blurRadius: 20,
                        offset: Offset(0, 0)
                      )
                    ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductPage(productArticle: widget.productArticle),
                ),
              );
            },
            icon: const Icon(
              Icons.info,
              color: Color(0xff41337A),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              widget.productUrlImage,
              fit: BoxFit.cover,
              width: 300,
              height: 350,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Тип: ${widget.typeProductId}",
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Склад: ${widget.warehouseId}",
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff41337A),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${widget.productCost.toString()} ₽",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart_checkout,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
