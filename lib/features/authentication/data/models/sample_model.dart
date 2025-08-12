// HAPA TUNAWEKA MODELS ZETU NA TUTATUMIA BUILD RUNNER KUGENERATE METHODS ZA KUTENGENEZA FROM JSON AND TO JSON

// COMMAND YA KURUN NI dart run build_runner watch HII MAKE SURE IPO ACTIVE


import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/data/models/default_page_model.dart';
import '../../../../shared/data/models/default_response_model.dart';

part 'sample_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AllFaqsResponse {
  final DefaultResponseModel response;
  final PageObject page;
  final List<FaqItem> data;

  AllFaqsResponse({
    required this.response,
    required this.page,
    required this.data,
  });

  factory AllFaqsResponse.fromJson(Map<String, dynamic> json) =>
      _$AllFaqsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllFaqsResponseToJson(this);

  factory AllFaqsResponse.error({required String message}) {
    return AllFaqsResponse(
      response: DefaultResponseModel(
        id: '0',
        status: false,
        code: 4000,
        message: message,
      ),
      page: PageObject.error(),
      data: [],
    );
  }
}

@JsonSerializable()
class FaqItem {
  final String id;
  final String uniqueId;
  final String question;
  final String answer;
  final String createdAt;

  FaqItem({
    required this.id,
    required this.uniqueId,
    required this.question,
    required this.answer,
    required this.createdAt,
  });

  factory FaqItem.fromJson(Map<String, dynamic> json) =>
      _$FaqItemFromJson(json);

  Map<String, dynamic> toJson() => _$FaqItemToJson(this);
}
