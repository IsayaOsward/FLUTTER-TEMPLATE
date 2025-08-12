import 'dart:async';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;

import '../../../features/authentication/data/services/auth_local_data_source.dart';
import '../../injection/injection_container.dart';
import '../api_credentials.dart';

class TimeoutHttpClient extends http.BaseClient {
  final http.Client _inner = http.Client();
  //this cancel the api call after specified durations
  final Duration timeoutDuration = Duration(seconds: apiCallTimeOut);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request).timeout(timeoutDuration);
  }
}

class GraphQLConfig {
  static Future<GraphQLClient> initializeClient() async {
    HttpLink httpLink = HttpLink(gqlServerUrl, httpClient: TimeoutHttpClient());
    final AuthSecureStorageDataSource secureStorage =
        getIt<AuthSecureStorageDataSource>();
    final token = await secureStorage.getToken();

    // Check if token is null before using it
    final AuthLink authLink = AuthLink(
      getToken: () async {
        if (token == null) {
          return null; // No token
        }
        // Return the token if valid
        return 'Bearer $token';
      },
    );

    final Link link = authLink.concat(httpLink);

    return GraphQLClient(
      link: link,
      queryRequestTimeout: Duration(seconds: apiCallTimeOut),
      cache: GraphQLCache(),
    );
  }
}
