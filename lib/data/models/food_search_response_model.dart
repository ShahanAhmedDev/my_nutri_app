// To parse this JSON data, do
//
//     final foodSearchResponse = foodSearchResponseFromJson(jsonString);

import 'dart:convert';

FoodSearchResponse foodSearchResponseFromJson(String str) => FoodSearchResponse.fromJson(json.decode(str));

String foodSearchResponseToJson(FoodSearchResponse data) => json.encode(data.toJson());

class FoodSearchResponse {
  int totalHits;
  int currentPage;
  int totalPages;
  List<int> pageList;
  FoodSearchCriteria foodSearchCriteria;
  List<Food> foods;
  Aggregations aggregations;

  FoodSearchResponse({
    required this.totalHits,
    required this.currentPage,
    required this.totalPages,
    required this.pageList,
    required this.foodSearchCriteria,
    required this.foods,
    required this.aggregations,
  });

  factory FoodSearchResponse.fromJson(Map<String, dynamic> json) => FoodSearchResponse(
    totalHits: json["totalHits"],
    currentPage: json["currentPage"],
    totalPages: json["totalPages"],
    pageList: List<int>.from(json["pageList"].map((x) => x)),
    foodSearchCriteria: FoodSearchCriteria.fromJson(json["foodSearchCriteria"]),
    foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
    aggregations: Aggregations.fromJson(json["aggregations"]),
  );

  Map<String, dynamic> toJson() => {
    "totalHits": totalHits,
    "currentPage": currentPage,
    "totalPages": totalPages,
    "pageList": List<dynamic>.from(pageList.map((x) => x)),
    "foodSearchCriteria": foodSearchCriteria.toJson(),
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    "aggregations": aggregations.toJson(),
  };
}

class Aggregations {
  DataType dataType;
  Nutrients nutrients;

  Aggregations({
    required this.dataType,
    required this.nutrients,
  });

  factory Aggregations.fromJson(Map<String, dynamic> json) => Aggregations(
    dataType: DataType.fromJson(json["dataType"]),
    nutrients: Nutrients.fromJson(json["nutrients"]),
  );

  Map<String, dynamic> toJson() => {
    "dataType": dataType.toJson(),
    "nutrients": nutrients.toJson(),
  };
}

class DataType {
  int branded;
  int srLegacy;
  int surveyFndds;

  DataType({
    required this.branded,
    required this.srLegacy,
    required this.surveyFndds,
  });

  factory DataType.fromJson(Map<String, dynamic> json) => DataType(
    branded: json["Branded"],
    srLegacy: json["SR Legacy"],
    surveyFndds: json["Survey (FNDDS)"],
  );

  Map<String, dynamic> toJson() => {
    "Branded": branded,
    "SR Legacy": srLegacy,
    "Survey (FNDDS)": surveyFndds,
  };
}

class Nutrients {
  Nutrients();

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
  );

  Map<String, dynamic> toJson() => {
  };
}

class FoodSearchCriteria {
  List<String> dataType;
  String query;
  String generalSearchInput;
  int pageNumber;
  String sortBy;
  String sortOrder;
  int numberOfResultsPerPage;
  int pageSize;
  bool requireAllWords;
  List<String> foodTypes;

  FoodSearchCriteria({
    required this.dataType,
    required this.query,
    required this.generalSearchInput,
    required this.pageNumber,
    required this.sortBy,
    required this.sortOrder,
    required this.numberOfResultsPerPage,
    required this.pageSize,
    required this.requireAllWords,
    required this.foodTypes,
  });

  factory FoodSearchCriteria.fromJson(Map<String, dynamic> json) => FoodSearchCriteria(
    dataType: List<String>.from(json["dataType"].map((x) => x)),
    query: json["query"],
    generalSearchInput: json["generalSearchInput"],
    pageNumber: json["pageNumber"],
    sortBy: json["sortBy"],
    sortOrder: json["sortOrder"],
    numberOfResultsPerPage: json["numberOfResultsPerPage"],
    pageSize: json["pageSize"],
    requireAllWords: json["requireAllWords"],
    foodTypes: List<String>.from(json["foodTypes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "dataType": List<dynamic>.from(dataType.map((x) => x)),
    "query": query,
    "generalSearchInput": generalSearchInput,
    "pageNumber": pageNumber,
    "sortBy": sortBy,
    "sortOrder": sortOrder,
    "numberOfResultsPerPage": numberOfResultsPerPage,
    "pageSize": pageSize,
    "requireAllWords": requireAllWords,
    "foodTypes": List<dynamic>.from(foodTypes.map((x) => x)),
  };
}

class Food {
  int fdcId;
  String description;
  String commonNames;
  String additionalDescriptions;
  String dataType;
  int ndbNumber;
  DateTime publishedDate;
  String foodCategory;
  String allHighlightFields;
  double score;
  List<dynamic> microbes;
  List<FoodNutrient> foodNutrients;
  List<dynamic> finalFoodInputFoods;
  List<dynamic> foodMeasures;
  List<dynamic> foodAttributes;
  List<dynamic> foodAttributeTypes;
  List<dynamic> foodVersionIds;

  Food({
    required this.fdcId,
    required this.description,
    required this.commonNames,
    required this.additionalDescriptions,
    required this.dataType,
    required this.ndbNumber,
    required this.publishedDate,
    required this.foodCategory,
    required this.allHighlightFields,
    required this.score,
    required this.microbes,
    required this.foodNutrients,
    required this.finalFoodInputFoods,
    required this.foodMeasures,
    required this.foodAttributes,
    required this.foodAttributeTypes,
    required this.foodVersionIds,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    fdcId: json["fdcId"],
    description: json["description"],
    commonNames: json["commonNames"],
    additionalDescriptions: json["additionalDescriptions"],
    dataType: json["dataType"],
    ndbNumber: json["ndbNumber"],
    publishedDate: DateTime.parse(json["publishedDate"]),
    foodCategory: json["foodCategory"],
    allHighlightFields: json["allHighlightFields"],
    score: json["score"]?.toDouble(),
    microbes: List<dynamic>.from(json["microbes"].map((x) => x)),
    foodNutrients: List<FoodNutrient>.from(json["foodNutrients"].map((x) => FoodNutrient.fromJson(x))),
    finalFoodInputFoods: List<dynamic>.from(json["finalFoodInputFoods"].map((x) => x)),
    foodMeasures: List<dynamic>.from(json["foodMeasures"].map((x) => x)),
    foodAttributes: List<dynamic>.from(json["foodAttributes"].map((x) => x)),
    foodAttributeTypes: List<dynamic>.from(json["foodAttributeTypes"].map((x) => x)),
    foodVersionIds: List<dynamic>.from(json["foodVersionIds"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "fdcId": fdcId,
    "description": description,
    "commonNames": commonNames,
    "additionalDescriptions": additionalDescriptions,
    "dataType": dataType,
    "ndbNumber": ndbNumber,
    "publishedDate": "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
    "foodCategory": foodCategory,
    "allHighlightFields": allHighlightFields,
    "score": score,
    "microbes": List<dynamic>.from(microbes.map((x) => x)),
    "foodNutrients": List<dynamic>.from(foodNutrients.map((x) => x.toJson())),
    "finalFoodInputFoods": List<dynamic>.from(finalFoodInputFoods.map((x) => x)),
    "foodMeasures": List<dynamic>.from(foodMeasures.map((x) => x)),
    "foodAttributes": List<dynamic>.from(foodAttributes.map((x) => x)),
    "foodAttributeTypes": List<dynamic>.from(foodAttributeTypes.map((x) => x)),
    "foodVersionIds": List<dynamic>.from(foodVersionIds.map((x) => x)),
  };
}


  class FoodNutrient {
  int nutrientId;
  String nutrientName;
  String nutrientNumber;
  UnitName unitName;
  String? derivationCode;
  String? derivationDescription;
  int? derivationId;
  double? value; // Made nullable and adjusted parsing accordingly
  int? foodNutrientSourceId;
  String? foodNutrientSourceCode;
  FoodNutrientSourceDescription? foodNutrientSourceDescription;
  int rank;
  int indentLevel;
  int foodNutrientId;
  int dataPoints;

  FoodNutrient({
  required this.nutrientId,
  required this.nutrientName,
  required this.nutrientNumber,
  required this.unitName,
  this.derivationCode,
  this.derivationDescription,
  this.derivationId,
  this.value, // Allow null values
  this.foodNutrientSourceId,
  this.foodNutrientSourceCode,
  this.foodNutrientSourceDescription,
  required this.rank,
  required this.indentLevel,
  required this.foodNutrientId,
  required this.dataPoints,
  });

  factory FoodNutrient.fromJson(Map<String, dynamic> json) => FoodNutrient(
  nutrientId: json["nutrientId"],
  nutrientName: json["nutrientName"],
  nutrientNumber: json["nutrientNumber"],
  unitName: unitNameValues.map[json["unitName"]]!,
  derivationCode: json["derivationCode"],
  derivationDescription: json["derivationDescription"],
  derivationId: json["derivationId"],
  value: json["value"]?.toDouble(),
  foodNutrientSourceId: json["foodNutrientSourceId"],
  foodNutrientSourceCode: json["foodNutrientSourceCode"],
  foodNutrientSourceDescription: foodNutrientSourceDescriptionValues.map[json["foodNutrientSourceDescription"]],
  rank: json["rank"],
  indentLevel: json["indentLevel"],
  foodNutrientId: json["foodNutrientId"],
  dataPoints: json["dataPoints"],
  );


  Map<String, dynamic> toJson() => {
    "nutrientId": nutrientId,
    "nutrientName": nutrientName,
    "nutrientNumber": nutrientNumber,
    "unitName": unitNameValues.reverse[unitName],
    "derivationCode": derivationCode,
    "derivationDescription": derivationDescription,
    "derivationId": derivationId,
    "value": value ?? '',
    "foodNutrientSourceId": foodNutrientSourceId,
    "foodNutrientSourceCode": foodNutrientSourceCode,
    "foodNutrientSourceDescription": foodNutrientSourceDescriptionValues.reverse[foodNutrientSourceDescription],
    "rank": rank,
    "indentLevel": indentLevel,
    "foodNutrientId": foodNutrientId,
    "dataPoints": dataPoints,
  };
}

enum FoodNutrientSourceDescription {
  ANALYTICAL_OR_DERIVED_FROM_ANALYTICAL,
  ASSUMED_ZERO,
  CALCULATED_FROM_NUTRIENT_LABEL_BY_NDL,
  CALCULATED_OR_IMPUTED,
  MANUFACTURER_S_ANALYTICAL_PARTIAL_DOCUMENTATION
}

final foodNutrientSourceDescriptionValues = EnumValues({
  "Analytical or derived from analytical": FoodNutrientSourceDescription.ANALYTICAL_OR_DERIVED_FROM_ANALYTICAL,
  "Assumed zero": FoodNutrientSourceDescription.ASSUMED_ZERO,
  "Calculated from nutrient label by NDL": FoodNutrientSourceDescription.CALCULATED_FROM_NUTRIENT_LABEL_BY_NDL,
  "Calculated or imputed": FoodNutrientSourceDescription.CALCULATED_OR_IMPUTED,
  "Manufacturer's analytical; partial documentation": FoodNutrientSourceDescription.MANUFACTURER_S_ANALYTICAL_PARTIAL_DOCUMENTATION
});

enum UnitName {
  G,
  IU,
  KCAL,
  K_J,
  MG,
  UG
}

final unitNameValues = EnumValues({
  "G": UnitName.G,
  "IU": UnitName.IU,
  "KCAL": UnitName.KCAL,
  "kJ": UnitName.K_J,
  "MG": UnitName.MG,
  "UG": UnitName.UG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
