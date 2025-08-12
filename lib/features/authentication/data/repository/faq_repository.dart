import 'package:sgr_mobile/features/authentication/data/services/faq_local_service.dart';
import 'package:sgr_mobile/features/authentication/data/services/remote_data_source.dart';

import '../models/sample_model.dart';

// HILI FILE LINAITWA KUTOKA KWENYE PROVIDER AMBAPO LITARETURN EITHER CACHED DATA OR ONLINE DATA
class FAQRepository {
  final _remote = FAQRemoteService();
  final _local = FAQLocalService();

  Future<AllFaqsResponse> getFaqs({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final localFaqs = await _local.getFaqs();
      if (localFaqs.data.isNotEmpty) {
        return localFaqs;
      }
    }

    final remoteFaqs = await _remote.fetchAllFAQs();
    if (remoteFaqs.data.isNotEmpty) {
      await _local.saveFaqs(remoteFaqs);
    }
    return remoteFaqs;
  }
}
