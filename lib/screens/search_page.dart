import 'package:blueberry/models/product_model.dart';
import 'package:blueberry/screens/product_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

TextEditingController controller = TextEditingController();
ProductModel? product;

class _SearchPageState extends State<SearchPage> {
  List<ProductModel> products = ProductModel.getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 90,
            backgroundColor: const Color(0xff6EA4BF),
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            floating: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                )),
            title: TextField(
              onChanged: searchProduct,
              controller: controller,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  hintText: "Поиск товара",
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                  )),
            ),
          ),
          SliverAnimatedList(
            key: UniqueKey(),
            initialItemCount: products.length,
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductPage(
                                productArticle: products[index].productArticle),
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
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void searchProduct(String query) {
    if (query.isEmpty) {
      setState(() {
        products.clear();
        products = ProductModel.getProducts();
      });
    }
    final suggestions = products.where((product) {
      final productName = product.productName.toLowerCase();
      final input = query.toLowerCase();

      return productName.contains(input);
    }).toList();

    setState(() => products = suggestions);
  }
}
