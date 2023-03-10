import 'package:ch05_scrollable_widgets/components/components.dart';
import 'package:ch05_scrollable_widgets/models/explore_data.dart';
import 'package:flutter/material.dart';

import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();
  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1
    return FutureBuilder(
      // 2
      future: mockService.getExploreData(),
      // 3
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // 5
          return ListView(
            // 6
            scrollDirection: Axis.vertical,
            children: [
              // 7
              TodayRecipelistView(
                recipes: snapshot.data?.todayRecipes ?? [],
              ),
              // 8
              const SizedBox(
                height: 16,
              ),
              // 9
              FriendPostListView(friendPosts: snapshot.data?.friendPosts ?? []),
            ],
          );
        } else {
          // 10
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
