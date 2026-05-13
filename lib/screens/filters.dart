import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

     return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!, 
            onChanged: (isChecked) {
              ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              "Glutten free"
            ),
            subtitle: Text(
              style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              "Only include glutten free meals"
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!, 
            onChanged: (isChecked) {
              ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              "Lactose free"
            ),
            subtitle: Text(
              style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              "Only include lactose free meals"
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!, 
            onChanged: (isChecked) {
              ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              "Vegetarian"
            ),
            subtitle: Text(
              style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              "Only include vegetarian meals"
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!, 
            onChanged: (isChecked) {
              ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              "Vegan"
            ),
            subtitle: Text(
              style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              "Only include vegan meals"
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}