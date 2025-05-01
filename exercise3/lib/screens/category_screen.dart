import 'package:exercise3/components/category_item.dart';
import 'package:exercise3/components/list_view.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.recipesOfCategory,
    required this.categories,
  });

  final Set<String> categories;
  final Set<Map<String, dynamic>> Function(String) recipesOfCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Choose a category'),
      ),
      body: StyledListView(
        children: <Widget>[
          ...categories.map(
            (cat) => CategoryItem(
              category: cat,
              recipesOfCategory: recipesOfCategory,
            ),
          ),
        ],
      ),
    );
  }
}
