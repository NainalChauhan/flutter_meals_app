import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget{
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filters, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return FiltersScreenState();
  }
}

enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan
}

class FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _isGlutenFreeFilterSet = widget.currentFilters[Filters.glutenFree] ?? false;
    _lactoseFreeFilterSet = widget.currentFilters[Filters.lactoseFree] ?? false;
    _vegetarianFilterSet = widget.currentFilters[Filters.vegetarian] ?? false;
    _veganFilterSet = widget.currentFilters[Filters.vegan] ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if(didPop) return;
          Navigator.of(context).pop({
            Filters.glutenFree: _isGlutenFreeFilterSet,
            Filters.lactoseFree: _lactoseFreeFilterSet,
            Filters.vegetarian: _vegetarianFilterSet,
            Filters.vegan: _veganFilterSet
          });
        },
        child: Column(
          children: [
            SwitchListTile(
                value: _isGlutenFreeFilterSet,
                onChanged: (isChecked){
                  setState(() {
                    _isGlutenFreeFilterSet = isChecked;
                  });
                },
              title: Text("Gluten-Free", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurface
              )),
              subtitle: Text("Include only Gluten-Free meals", style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              )),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text("Lactose-Free", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              )),
              subtitle: Text("Include only Lactose-Free meals", style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              )),
            ),
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              title: Text("Vegetarian Meals", style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              )),
              subtitle: Text("Include only vegetarian meals", style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              )),
            ),
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _veganFilterSet = isChecked;
                });
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
      ),
    );
  }

}