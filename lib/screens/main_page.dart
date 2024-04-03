import 'package:blueberry/components/first_page.dart';
import 'package:blueberry/models/product_model.dart';
import 'package:blueberry/screens/auth_page.dart';
import 'package:blueberry/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  List<ProductModel> products = ProductModel.getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          FirstPage(products: products),
          const AuthPage(),
          const SettingsPage()
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: GNav(
        onTabChange: (page) {
          setState(() {
            _selectedIndex = page;
            _pageController.animateToPage(page,
                duration: Durations.medium3, curve: Curves.easeInOutCirc);
          });
        },
        tabMargin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        selectedIndex: _selectedIndex,
        color: Colors.white,
        gap: 8,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        activeColor: const Color(0xffC2EFEB),
        tabBackgroundColor: const Color(0xffC2EFEB).withOpacity(0.2),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Главная',
          ),
          GButton(
            icon: Icons.monetization_on,
            text: 'Заказы',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Настройки',
          ),
        ],
      ),
    );
  }
}
