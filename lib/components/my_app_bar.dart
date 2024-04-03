import 'package:blueberry/screens/search_page.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final void Function()? onTap;
  const MyAppBar({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      backgroundColor: const Color(0xff6EA4BF),
      centerTitle: true,
      expandedHeight: 65,
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ));
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ],
      title: const Text(
        'B L U E B E R R Y',
        style: TextStyle(color: Color(0xff41337A), fontWeight: FontWeight.bold),
      ),
    );
  }
}
