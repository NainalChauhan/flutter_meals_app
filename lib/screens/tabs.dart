import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favourites_providers.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return TabsScreenState();
  }
}

class TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void onTabBarTap(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectDrawerItem(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(builder: (ctx) => FiltersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activeScreen = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = "Category";
    
    if (_selectedPageIndex == 1) {
      final favouriteMeals = ref.watch(favouritesNotifierProvider);
      activeScreen = MealsScreen(
        mealList: favouriteMeals,
      );
      activePageTitle = "Favourites";
    }
    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectItem: _selectDrawerItem),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabBarTap,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ],
      ),
    );
  }
}
