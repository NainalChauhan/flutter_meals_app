import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifierProvider extends Notifier<Map<Filters, bool>> {
  @override
  Map<Filters, bool> build() {
    return {
      Filters.glutenFree: false,
      Filters.lactoseFree: false,
      Filters.vegetarian: false,
      Filters.vegan: false,
    };
  }

  void setFilters(Map<Filters, bool> filters) {
    state = filters;
  }

  void setFilter(Filters filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    NotifierProvider<FiltersNotifierProvider, Map<Filters, bool>>(
      FiltersNotifierProvider.new,
    );

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if(activeFilters[Filters.glutenFree]! && !meal.isGlutenFree){
      return false;
    }
    if(activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree){
      return false;
    }
    if(activeFilters[Filters.vegetarian]! && !meal.isVegetarian){
      return false;
    }
    if(activeFilters[Filters.vegan]! && !meal.isVegan){
      return false;
    }
    return true;
  }).toList();
});
