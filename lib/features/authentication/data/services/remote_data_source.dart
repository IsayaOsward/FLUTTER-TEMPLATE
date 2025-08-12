import 'package:sgr_mobile/core/api_config/graphql/graphql_service.dart';
import 'package:sgr_mobile/core/enums/graphq_operation_type.dart';
import 'package:sgr_mobile/core/injection/injection_container.dart';
import 'package:sgr_mobile/features/authentication/data/graphql/queries.dart';
import '../models/sample_model.dart';

class FAQRemoteService {
  final graphQLService = getIt<GraphQLService>();

  Future<AllFaqsResponse> fetchAllFAQs() async {
    final response = await graphQLService.performGraphQLOperation(
      responseKey: "getAllFaqs",
      operationString: getAllFaq,
      operationType: OperationType.query,
      fromJson: AllFaqsResponse.fromJson,
    );

    if (response?.response.status ?? false) {
      return response!;
    } else {
      return AllFaqsResponse.error(
        message: "WEKA MESSAGE YA KUCATCH ERROR HAPA",
      );
    }
  }
}
