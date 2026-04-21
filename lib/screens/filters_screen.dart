import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget{
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filters.glutenFree] ?? false,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(
                    Filters.glutenFree, isChecked);
                },
              title: Text("Gluten-Free", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface
              )),
              subtitle: Text("Include only Gluten-Free meals", style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              )),
            ),
            SwitchListTile(
              value: activeFilters[Filters.lactoseFree] ?? false,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(
                    Filters.lactoseFree, isChecked);
              },
              title: Text("Lactose-Free", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              )),
              subtitle: Text("Include only Lactose-Free meals", style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              )),
            ),
            SwitchListTile(
              value: activeFilters[Filters.vegetarian] ?? false,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(
                    Filters.vegetarian, isChecked);
              },
              title: Text("Vegetarian Meals", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              )),
              subtitle: Text("Include only vegetarian meals", style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              )),
            ),
            SwitchListTile(
              value: activeFilters[Filters.vegan] ?? false,
              onChanged: (isChecked) {
                ref.read(filtersProvider.notifier).setFilter(
                    Filters.vegan, isChecked);
              },
              title: Text("Vegan Meals", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              )),
              subtitle: Text("Include only Vegan meals", style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              )),
            )
          ],
        ),
    );
  }

}