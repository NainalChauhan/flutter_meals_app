import 'package:flutter_riverpod/flutter_riverpod.dart';

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
