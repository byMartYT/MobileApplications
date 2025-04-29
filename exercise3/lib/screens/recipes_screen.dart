import 'package:exercise3/components/list_view.dart';
import 'package:exercise3/components/recipe_item.dart';
import 'package:flutter/material.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({
    super.key,
    required this.categoryName,
    required this.recipes,
  });

  final Set<Map<String, dynamic>> recipes;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${categoryName[0].toUpperCase()}${categoryName.substring(1)}',
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: StyledListView(
        children: [...recipes.map((item) => RecipeItem(recipe: item))],
      ),
    );
  }
}
