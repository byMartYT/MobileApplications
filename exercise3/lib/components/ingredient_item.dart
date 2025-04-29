import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({super.key, required this.ingredient});

  final String ingredient;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${ingredient[0].toUpperCase()}${ingredient.substring(1)}'),
    );
  }
}
