
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_nutri_app/data/models/food_search_item_response.dart';
import 'package:my_nutri_app/data/models/food_search_response_model.dart';


class FoodDataService {
  final String _apiKey = 'XVn3lsSWBjreG8uCnFIlwpItYthkCgo4RVYW9RYu';

  Future<FoodSearchResponse> searchFood(String query) async {
    // Uri.parse('https://api.nal.usda.gov/fdc/v1/foods/search?query=mango&dataType=SR%20Legacy&pageSize=2&pageNumber=2&sortBy=dataType.keyword&sortOrder=asc&api_key=YOUR_API_KEY'),
    final response = await http.get(
      // Uri.parse('https://api.nal.usda.gov/fdc/v1/foods/search?api_key=$_apiKey&query=$query'),
      Uri.parse('https://api.nal.usda.gov/fdc/v1/foods/search?query=$query&dataType=SR%20Legacy&pageSize=8&pageNumber=2&sortBy=dataType.keyword&sortOrder=asc&api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {
      print('This is the response ${response.body}');
      // If the server returns a 200 OK response, then parse the JSON.
      return foodSearchResponseFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response then throw an exception.
      throw Exception('Failed to load food data');
    }
  }


  Future<FoodDetailResponse> fetchFoodDetail(int fdcId) async {
    final response = await http.get(
      Uri.parse('https://api.nal.usda.gov/fdc/v1/food/$fdcId?nutrients=203&nutrients=204&nutrients=205&api_key=$_apiKey'),
    );

    if (response.statusCode == 200) {

      print("This is the response boss ${response.body}");
      var resposneData = foodDetailResponseFromJson(response.body);
      print("This is hte response data $resposneData");
      return resposneData;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load food detail');
    }
  }
}