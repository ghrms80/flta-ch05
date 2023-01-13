import 'package:flutter/material.dart';
// 1
import 'package:ch05_scrollable_widgets/models/models.dart';

class TodayRecipelistView extends StatelessWidget {
  // 2
  final List<ExploreRecipe> recipes;

  const TodayRecipelistView({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    // 3
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      // 4
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 5
          Text(
            'Recipes of the Day 🍳', // fried egg
            style: Theme.of(context).textTheme.headline1,
          ),
          // 6
          const SizedBox(
            height: 16,
          ),
          // 7
          Container(
            height: 400,
            // TODO: Add ListView Here
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
  // TODO: Add buildCard() widget here
}
