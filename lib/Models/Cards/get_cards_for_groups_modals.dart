import 'package:concard/Models/Cards/specific_card_model.dart';

class GetCardsForGroup {
  final List<CustomCardsModel>? cardsList;

  GetCardsForGroup({
    this.cardsList,
  });

  GetCardsForGroup.fromJson(Map<String, dynamic> json)
    : cardsList = (json['cards'] as List?)?.map((dynamic e) => CustomCardsModel.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'cards' : cardsList?.map((e) => e.toJson()).toList()
  };
}