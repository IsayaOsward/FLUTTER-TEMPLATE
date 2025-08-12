// HUMU TUNAWEKA QUERY STRINGS ZA SPECIFIC FEATURE

import '../../../../shared/default_graphql_objects.dart';

const String getAllFaq = '''
query GetAllFaq(\$filtering: FAQsFilteringInputObject) {
  getAllFaqs(filtering: \$filtering) {
    $defaultResponseObjectString
    $defaultPageObjectString
    data {
      id
      uniqueId
      question
      answer
      createdAt
    }
  }
}
''';
