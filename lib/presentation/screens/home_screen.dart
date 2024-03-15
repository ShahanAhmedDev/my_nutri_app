import 'package:flutter/material.dart';
import 'package:my_nutri_app/presentation/screens/components/circle_and_texts.dart';
import 'package:my_nutri_app/presentation/screens/components/curved_line.dart';
import 'package:my_nutri_app/presentation/screens/components/food_response_list_view_widget.dart';
import 'package:my_nutri_app/presentation/screens/name_heart_notification_widget.dart';
import 'package:my_nutri_app/presentation/screens/search_bar.dart';
import 'package:my_nutri_app/utils/extensions/common_functions.dart';

import 'custom_bar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController;
  String currentQuery = '';

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  void _handleSearch(String query) {
    setState(() {
      currentQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12),
          child: Column(
            children: [
              SizedBox(height: CommonFunctions.deviceHeight(context) * 0.07),
              const NameHeartNotificationWidget(),
              SizedBox(height: CommonFunctions.deviceHeight(context) * 0.024),
              CustomSearchBar(
                searchController: searchController,
                onSearchSubmitted: _handleSearch,
              ),
              CustomBarChart(),
              const CircleAndTexts(),
              SizedBox(
                width: 440,
                height: 30,
                child: CustomPaint(painter: CurvedLinePainter()),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Text(
                  'Search Results:',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              FoodListView(searchedQuery: currentQuery),
            ],
          ),
        ),
      ),
    );
  }
}


