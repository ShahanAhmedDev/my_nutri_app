import 'package:flutter/material.dart';
import 'package:my_nutri_app/data/data_source/usda_api_calls.dart';
import 'package:my_nutri_app/data/models/food_search_response_model.dart';
import 'package:my_nutri_app/presentation/screens/food_details_screen.dart';
import 'package:my_nutri_app/utils/resources/loader.dart';

class FoodListView extends StatefulWidget {
  String searchedQuery;

  FoodListView({required this.searchedQuery});

  @override
  State<FoodListView> createState() => _FoodListViewState();
}

class _FoodListViewState extends State<FoodListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FoodSearchResponse>(
      future: FoodDataService().searchFood(
          widget.searchedQuery == '' ? 'mango' : widget.searchedQuery),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text(
                "Sorry, We couldn't find that, can you try searching again");
          } else if (snapshot.hasData) {
            return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.foods.length,
              itemBuilder: (context, index) {
                var food = snapshot.data!.foods[index];
                print('this is what i got $food');
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            FoodDetailScreen(fdcId: food.fdcId),
                      ));
                    },
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    title: Text(food.description,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${food.fdcId}'),
                        // Example of adding more details:
                        Text('Category: ${food.foodCategory}'),
                        // You can expand this section with more information about the food
                      ],
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 0,
                );
              },
            );
          }
        }
        return const Padding(
          padding: const EdgeInsets.all(4.0),
          child: CustomCircularProgressIndicator(
            progress: 0.9,
            size: 30,
            progressColor: Colors.blue,
            backgroundColor: Colors.transparent,
          ),
        );
      },
    );
  }
}
