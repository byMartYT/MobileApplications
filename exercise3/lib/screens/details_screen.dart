import 'package:exercise3/components/ingredient_item.dart';
import 'package:exercise3/components/list_view.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.recipe});

  final Map<String, dynamic> recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(recipe['name'] as String),
      ),
      body: StyledListView(
        children: [
          Text(
            'Ingredients',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ...((recipe['ingredients'] as List<dynamic>)
              .map((item) => IngredientItem(ingredient: item))
              .toList()),
        ],
      ),
    );
  }
}
