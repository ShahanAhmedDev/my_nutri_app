import 'package:flutter/material.dart';
import 'package:my_nutri_app/data/data_source/usda_api_calls.dart';
import 'package:my_nutri_app/data/models/food_search_item_response.dart';
import 'package:my_nutri_app/utils/extensions/common_functions.dart';
import 'package:my_nutri_app/utils/resources/loader.dart'; // Ensure this model file includes all the classes and modifications mentioned previously.

class FoodDetailScreen extends StatefulWidget {
  final int fdcId;

  const FoodDetailScreen({Key? key, required this.fdcId}) : super(key: key);

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  late Future<FoodDetailResponse> foodDetail;

  @override
  void initState() {
    super.initState();
    foodDetail = FoodDataService().fetchFoodDetail(widget.fdcId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12),
        child: Column(
          children: [
            SizedBox(
              height: CommonFunctions.deviceHeight(context) * 0.07,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
                SizedBox(width: CommonFunctions.deviceHeight(context) * 0.05,),
                Center(child: Text('Food Details:',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),)),
                SizedBox(width: CommonFunctions.deviceHeight(context) * 0.1,),
              ],
            ),
            FutureBuilder<FoodDetailResponse>(
              future: foodDetail,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError || !snapshot.hasData) {
                    return Center(child: Text("Error fetching food details"));
                  }

                  final data = snapshot.data!;
                  return SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Description: ${data.description}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text('Publication Date: ${data.publicationDate}'),
                          SizedBox(height: 10),
                          Text('Data Type: ${data.dataType}'),
                          SizedBox(height: 10),
                          Text('Food Class: ${data.foodClass ?? "N/A"}'),
                          SizedBox(height: 20),
                          Text('Nutrients:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(), // to disable ListView's scrolling
                            shrinkWrap: true, // You won't see anything without this.
                            itemCount: data.foodNutrients?.length ?? 0,
                            itemBuilder: (context, index) {
                              final nutrient = data.foodNutrients![index];
                              return ListTile(
                                title: Text(nutrient.nutrient?.name ?? "Unknown nutrient"),
                                subtitle: Text('Amount: ${nutrient.amount ?? "N/A"} ${nutrient.nutrient?.unitName ?? ""}'),
                              );
                            },
                          ),
                          SizedBox(height: 20),
                          if (data.foodPortions != null && data.foodPortions!.isNotEmpty) Text('Food Portions:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ...?data.foodPortions?.map((portion) => ListTile(
                            title: Text('${portion.amount} ${portion.modifier} (${portion.gramWeight}g)'),
                          )),
                        ],
                      ),
                    ),
                  );
                } else {
                  return  Padding(
                    padding: EdgeInsets.only(top: CommonFunctions.deviceHeight(context) * 0.4),
                    child: const Center(
                      child: CustomCircularProgressIndicator(
                        progress: 0.9,
                        size: 30,
                        progressColor: Colors.blue,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
