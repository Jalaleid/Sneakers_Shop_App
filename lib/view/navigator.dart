// ignore_for_file: unused_field, prefer_final_fields, non_constant_identifier_names, unused_element

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneakers_shop_app/utils/constants.dart';

import 'home/homeview.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;
  PageController _PageController = PageController();

  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
    //_PageController.jumpToPage(_selectedIndex);
    _PageController.animateToPage(_selectedIndex,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);

    void dispose() {
      _PageController.dispose();
      super.dispose();
    }
  }

  List<Widget> screens = [
    const HomeView(),
    Container(
      color: Colors.deepOrange,
    ),
    Container(
      color: Colors.blueAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _PageController,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        bubbleCurve: Curves.linear,
        selectedColor: AppConstantsColor.materialButtonColor,
        strokeColor: AppConstantsColor.materialButtonColor,
        unSelectedColor: Colors.grey,
        backgroundColor: Colors.white,
        scaleFactor: 0.1,
        items: [
          CustomNavigationBarItem(icon: const Icon(CupertinoIcons.home)),
          CustomNavigationBarItem(
              icon: const Icon(CupertinoIcons.shopping_cart)),
          CustomNavigationBarItem(icon: const Icon(CupertinoIcons.person))
        ],
      ),
    );
  }
}
