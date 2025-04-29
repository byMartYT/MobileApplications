import 'package:exercise3/screens/recipes_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String category;
  final Set<Map<String, dynamic>> Function(String) recipesOfCategory;

  const CategoryItem({
    super.key,
    required this.category,
    required this.recipesOfCategory,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Hier kannst du die gewünschte Aktion hinzufügen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => RecipesScreen(
                  categoryName: category,
                  recipes: recipesOfCategory(category),
                ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(color: const Color.fromARGB(255, 244, 244, 244)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              offset: Offset(0, 4),
              color: const Color.fromARGB(24, 0, 0, 0),
              blurStyle: BlurStyle.normal,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Column(
          spacing: 10,

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.asset(
                'assets/images/$category.jpg',
                height: 150,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Text(
              '${category[0].toUpperCase()}${category.substring(1)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
