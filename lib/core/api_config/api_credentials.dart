import 'package:flutter_dotenv/flutter_dotenv.dart';

final String baseUrl = dotenv.env['BASE_URL']!;
final String clientId = dotenv.env['CLIENT_ID']!;
final String clientSecret = dotenv.env['CLIENT_SECRET']!;
const passWordGrantType = 'password';
const refreshTokenGrantType = 'refresh_token';
const sessionTimeOut = 900000;
const apiCallTimeOut = 30;
final String loginUrls = '$baseUrl/oauth2/access_token';
final gqlServerUrl = '$baseUrl/graphql';
final mediaUrl = '$baseUrl/media';