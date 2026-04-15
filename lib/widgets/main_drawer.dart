import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectItem});

  final void Function(String identifier) onSelectItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withAlpha(200)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood, color: Theme.of(context).colorScheme.primary, size: 48,),
                SizedBox(width: 20),
                Text("Cooking Up!",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary
                  ),)
              ],
            )
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              color: Theme.of(context).colorScheme.onSurface,
              size: 26,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24
              ),
            ),
            onTap: () {
              onSelectItem("meals");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onSurface,
              size: 26,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 24
              ),
            ),
            onTap: () {
              onSelectItem("filters");
            },
          ),
        ],
      ),
    );
  }

}