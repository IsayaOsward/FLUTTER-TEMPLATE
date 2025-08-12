// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllFaqsResponse _$AllFaqsResponseFromJson(Map<String, dynamic> json) =>
    AllFaqsResponse(
      response: DefaultResponseModel.fromJson(
        json['response'] as Map<String, dynamic>,
      ),
      page: PageObject.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => FaqItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllFaqsResponseToJson(AllFaqsResponse instance) =>
    <String, dynamic>{
      'response': instance.response.toJson(),
      'page': instance.page.toJson(),
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

FaqItem _$FaqItemFromJson(Map<String, dynamic> json) => FaqItem(
  id: json['id'] as String,
  uniqueId: json['uniqueId'] as String,
  question: json['question'] as String,
  answer: json['answer'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$FaqItemToJson(FaqItem instance) => <String, dynamic>{
  'id': instance.id,
  'uniqueId': instance.uniqueId,
  'question': instance.question,
  'answer': instance.answer,
  'createdAt': instance.createdAt,
};
