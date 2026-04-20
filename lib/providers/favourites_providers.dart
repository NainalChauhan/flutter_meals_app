import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouritesMealNotifier extends Notifier<List<Meal>> {
  @override
  List<Meal> build() => [];

  bool toggleMealFavouriteStatus(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritesNotifierProvider =
    NotifierProvider<FavouritesMealNotifier, List<Meal>>(
      FavouritesMealNotifier.new,
    );
