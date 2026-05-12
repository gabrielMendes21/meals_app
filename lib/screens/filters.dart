import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _gluttenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _gluttenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) async {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _gluttenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttenFreeFilterSet, 
              onChanged: (isChecked) {
                setState(() {
                  _gluttenFreeFilterSet = isChecked;
                });
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
              value: _lactoseFreeFilterSet, 
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
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
              value: _vegetarianFilterSet, 
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
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
              value: _veganFilterSet, 
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
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
        )
      ),
     );
  }
}