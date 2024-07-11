import 'package:flutter/material.dart';
import 'package:recipie_app/presentation/core/bottom_nav_bar.dart';
import 'package:recipie_app/presentation/pages/home/home_page.dart';
import 'package:recipie_app/presentation/pages/recipe_categories/categories_page.dart';
import 'package:recipie_app/presentation/pages/saved_recipe/saved_recipes_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
          onTap: (index) {
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut);
            setState(() {
              currentIndex = index;
            });
          },
          selectedIndex: currentIndex),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          CategoriesPage(),
          SavedRecipesPage(),
        ],
      ),
    );
  }
}
