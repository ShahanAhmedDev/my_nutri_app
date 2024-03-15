import 'dart:convert';

FoodDetailResponse foodDetailResponseFromJson(String str) => FoodDetailResponse.fromJson(json.decode(str));
// String foodDetailResponseToJson(FoodDetailResponse data) => json.encode(data.toJson());

class FoodDetailResponse {
  int? fdcId;
  String? description;
  String? publicationDate;
  List<FoodNutrient>? foodNutrients;
  List<FoodPortion>? foodPortions;
  String? dataType;
  String? foodClass;
  List<dynamic>? foodComponents;
  List<dynamic>? foodAttributes;
  List<NutrientConversionFactor>? nutrientConversionFactors;
  List<dynamic>? inputFoods;
  int? ndbNumber;
  bool? isHistoricalReference;
  FoodCategory? foodCategory;

  FoodDetailResponse({
    this.fdcId,
    this.description,
    this.publicationDate,
    this.foodNutrients,
    this.foodPortions,
    this.dataType,
    this.foodClass,
    this.foodComponents,
    this.foodAttributes,
    this.nutrientConversionFactors,
    this.inputFoods,
    this.ndbNumber,
    this.isHistoricalReference,
    this.foodCategory,
  });

  factory FoodDetailResponse.fromJson(Map<String, dynamic> json) => FoodDetailResponse(
    fdcId: json['fdcId'],
    description: json['description'],
    publicationDate: json['publicationDate'],
    foodNutrients: json['foodNutrients'] != null ? List<FoodNutrient>.from(json['foodNutrients'].map((x) => FoodNutrient.fromJson(x))) : null,
    foodPortions: json['foodPortions'] != null ? List<FoodPortion>.from(json['foodPortions'].map((x) => FoodPortion.fromJson(x))) : null,
    dataType: json['dataType'],
    foodClass: json['foodClass'],
    foodComponents: json['foodComponents'] != null ? List<dynamic>.from(json['foodComponents']) : null,
    foodAttributes: json['foodAttributes'] != null ? List<dynamic>.from(json['foodAttributes']) : null,
    nutrientConversionFactors: json['nutrientConversionFactors'] != null ? List<NutrientConversionFactor>.from(json['nutrientConversionFactors'].map((x) => NutrientConversionFactor.fromJson(x))) : null,
    inputFoods: json['inputFoods'] != null ? List<dynamic>.from(json['inputFoods']) : null,
    ndbNumber: json['ndbNumber'],
    isHistoricalReference: json['isHistoricalReference'],
    foodCategory: json['foodCategory'] != null ? FoodCategory.fromJson(json['foodCategory']) : null,
  );
}

class FoodNutrient {
  String? type;
  Nutrient? nutrient;
  int? id;
  double? amount;
  int? dataPoints;
  FoodNutrientDerivation? foodNutrientDerivation;

  FoodNutrient({
    this.type,
    this.nutrient,
    this.id,
    this.amount,
    this.dataPoints,
    this.foodNutrientDerivation,
  });

  factory FoodNutrient.fromJson(Map<String, dynamic> json) => FoodNutrient(
    type: json['type'],
    nutrient: json['nutrient'] != null ? Nutrient.fromJson(json['nutrient']) : null,
    id: json['id'],
    amount: json['amount']?.toDouble(),
    dataPoints: json['dataPoints'],
    foodNutrientDerivation: json['foodNutrientDerivation'] != null ? FoodNutrientDerivation.fromJson(json['foodNutrientDerivation']) : null,
  );
}

class Nutrient {
  int? id;
  String? number;
  String? name;
  int? rank;
  String? unitName;

  Nutrient({
    this.id,
    this.number,
    this.name,
    this.rank,
    this.unitName,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) => Nutrient(
    id: json['id'],
    number: json['number'],
    name: json['name'],
    rank: json['rank'],
    unitName: json['unitName'],
  );
}

class FoodNutrientDerivation {
  int? id;
  String? code;
  String? description;
  FoodNutrientSource? foodNutrientSource;

  FoodNutrientDerivation({
    this.id,
    this.code,
    this.description,
    this.foodNutrientSource,
  });

  factory FoodNutrientDerivation.fromJson(Map<String, dynamic> json) => FoodNutrientDerivation(
    id: json['id'],
    code: json['code'],
    description: json['description'],
    foodNutrientSource: json['foodNutrientSource'] != null ? FoodNutrientSource.fromJson(json['foodNutrientSource']) : null,
  );
}

class FoodNutrientSource {
  int? id;
  String? code;
  String? description;

  FoodNutrientSource({
    this.id,
    this.code,
    this.description,
  });

  factory FoodNutrientSource.fromJson(Map<String, dynamic> json) => FoodNutrientSource(
    id: json['id'],
    code: json['code'],
    description: json['description'],
  );
}

class FoodPortion {
  int? id;
  double? gramWeight;
  int? sequenceNumber;
  double? amount;
  String? modifier;
  MeasureUnit? measureUnit;

  FoodPortion({
    this.id,
    this.gramWeight,
    this.sequenceNumber,
    this.amount,
    this.modifier,
    this.measureUnit,
  });

  factory FoodPortion.fromJson(Map<String, dynamic> json) => FoodPortion(
    id: json['id'],
    gramWeight: json['gramWeight']?.toDouble(),
    sequenceNumber: json['sequenceNumber'],
    amount: json['amount']?.toDouble(),
    modifier: json['modifier'],
    measureUnit: json['measureUnit'] != null ? MeasureUnit.fromJson(json['measureUnit']) : null,
  );
}

class MeasureUnit {
  int? id;
  String? name;
  String? abbreviation;

  MeasureUnit({
    this.id,
    this.name,
    this.abbreviation,
  });

  factory MeasureUnit.fromJson(Map<String, dynamic> json) => MeasureUnit(
    id: json['id'],
    name: json['name'],
    abbreviation: json['abbreviation'],
  );
}

class NutrientConversionFactor {
  int? id;
  double? proteinValue;
  double? fatValue;
  double? carbohydrateValue;
  String? type;
  String? name;
  double? value;

  NutrientConversionFactor({
    this.id,
    this.proteinValue,
    this.fatValue,
    this.carbohydrateValue,
    this.type,
    this.name,
    this.value,
  });

  factory NutrientConversionFactor.fromJson(Map<String, dynamic> json) => NutrientConversionFactor(
    id: json['id'],
    proteinValue: json['proteinValue']?.toDouble(),
    fatValue: json['fatValue']?.toDouble(),
    carbohydrateValue: json['carbohydrateValue']?.toDouble(),
    type: json['type'],
    name: json['name'],
    value: json['value']?.toDouble(),
  );
}

class FoodCategory {
  int? id;
  String? code;
  String? description;

  FoodCategory({
    this.id,
    this.code,
    this.description,
  });

  factory FoodCategory.fromJson(Map<String, dynamic> json) => FoodCategory(
    id: json['id'],
    code: json['code'],
    description: json['description'],
  );
}
