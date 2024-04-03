import 'package:blueberry/components/button_to_cart.dart';
import 'package:blueberry/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductPage extends StatelessWidget {
  final String productArticle;
  const ProductPage({super.key, required this.productArticle});

  ProductModel getProduct() {
    ProductModel? product;
    for (var item in ProductModel.getProducts()) {
      if (item.productArticle == productArticle) {
        product = item;
      }
    }
    return product!;
  }

  @override
  Widget build(BuildContext context) {
    ProductModel product = getProduct();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(product.productName),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 156, 228, 222),
                            blurRadius: 20,
                            offset: Offset(5, 10))
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: product.productUrlImage,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            product.productName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffC2EFEB),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          "${product.productCost.toString()} ₽",
                          style: const TextStyle(
                              color: Color(0xff41337A),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Описание:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    product.productDesc,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                const Center(
                  child: ButtonToCart(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
