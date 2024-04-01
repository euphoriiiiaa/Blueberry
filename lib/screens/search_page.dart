import 'package:blueberry/models/product_model.dart';
import 'package:blueberry/screens/product_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

List<ProductModel> products = [];
TextEditingController controller = TextEditingController();
ProductModel? product;

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    if (controller.text.isEmpty) {
      setState(() {
        products.clear();
        products = ProductModel.getProducts();
      });
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: searchProduct,
                controller: controller,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    hintText: "Поиск товара",
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    product = products[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProductPage(productArticle: products[index].productArticle),
                          ));
                        },
                        title: Text(
                          products[index].productName,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text("${products[index].productCost.toString()} ₽"),
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void searchProduct(String query) {
    final suggestions = products.where((product) {
      final productName = product.productName.toLowerCase();
      final input = query.toLowerCase();

      return productName.contains(input);
    }).toList();

    setState(() => products = suggestions);
  }
}
