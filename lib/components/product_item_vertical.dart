
import 'package:blueberry/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductItemVertical extends StatefulWidget {
  final String productUrlImage;
  final String productArticle;
  const ProductItemVertical({
    super.key,
    required this.productUrlImage,
    required this.productArticle,
  });

  @override
  State<ProductItemVertical> createState() => _ProductItemVerticalState();
}

class _ProductItemVerticalState extends State<ProductItemVertical> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 128, 231, 223),
                        blurRadius: 2,
                        offset: Offset(0, 0)
                      )
                    ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductPage(productArticle: widget.productArticle),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.productUrlImage,
                fit: BoxFit.cover,
                width: 200,
                height: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
