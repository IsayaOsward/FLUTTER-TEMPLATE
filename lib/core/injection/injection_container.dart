import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_template/core/api_config/graphql/graphql_service.dart';
import 'package:get_it/get_it.dart';

import '../../features/authentication/data/services/auth_local_data_source.dart';
import '../../shared/utils/helper_methods/device_security_checker.dart';
import '../api_config/rest_api/rest_api_service.dart';
import '../storage/secure_storage_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<AuthSecureStorageDataSource>(
    () => AuthSecureStorageDataSourceImpl(getIt<SecureStorageService>()),
  );
  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageServiceImpl(getIt<FlutterSecureStorage>()),
  );
  getIt.registerLazySingleton<RestApiService>(() => RestApiService());
  getIt.registerLazySingleton<DeviceSecurityChecker>(
    () => DeviceSecurityChecker(),
  );

  getIt.registerLazySingleton<GraphQLService>(() => GraphQLService());
}
