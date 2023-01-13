import 'package:ch05_scrollable_widgets/components/card1.dart';
import 'package:ch05_scrollable_widgets/components/card2.dart';
import 'package:ch05_scrollable_widgets/components/card3.dart';
import 'package:flutter/material.dart';
import 'package:ch05_scrollable_widgets/models/models.dart';

class TodayRecipelistView extends StatelessWidget {
  final List<ExploreRecipe> recipes;

  const TodayRecipelistView({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipes of the Day 🍳',
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 400,
            // 1
            color: Colors.transparent,
            // 2
            child: ListView.separated(
              //  3
              scrollDirection: Axis.horizontal,
              //  4
              itemCount: recipes.length,
              // 5
              itemBuilder: (context, index) {
                // 6
                final recipe = recipes[index];
                return buildCard(recipe);
              },
              // 7
              separatorBuilder: (context, index) {
                // 8
                return const SizedBox(
                  height: 16,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(ExploreRecipe recipe) {
    if (recipe.cardType == RecipeCardType.card1) {
      return Card1(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card2) {
      return Card2(recipe: recipe);
    } else if (recipe.cardType == RecipeCardType.card3) {
      return Card3(recipe: recipe);
    } else {
      throw Exception('This card doesn\'t exist yet');
    }
  }
}
