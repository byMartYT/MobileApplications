import 'package:exercise3/components/category_item.dart';
import 'package:exercise3/components/list_view.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static const List<String> categorys = ['italian', 'indian', 'turkish'];

  const CategoryScreen({super.key, required this.recipesOfCategory});

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
          ...categorys.map(
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
