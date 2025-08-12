// HAPA TUNATUNZA DATA LOCALLY NA KUFETCH FOR SPECIFIG FEATURE

import 'package:sgr_mobile/core/injection/injection_container.dart';
import 'package:sgr_mobile/core/storage/secure_storage_service.dart';

import '../models/sample_model.dart';
import 'dart:convert';

class FAQLocalService {
  final _storage = getIt<SecureStorageService>();

  static const _faqKey = "cached_faqs";

  Future<void> saveFaqs(AllFaqsResponse faqs) async {
    await _storage.saveItem(key: _faqKey, value: jsonEncode(faqs.toJson()));
  }

  Future<AllFaqsResponse> getFaqs() async {
    final jsonString = await _storage.getItem(key: _faqKey);
    if (jsonString != null) {
      return AllFaqsResponse.fromJson(jsonDecode(jsonString));
    }
    return AllFaqsResponse.error(message: "UTAWEKA MESSAGE HAPA");
  }
}
