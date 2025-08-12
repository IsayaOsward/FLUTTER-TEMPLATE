import '../../../../core/storage/secure_storage_service.dart';

abstract class AuthSecureStorageDataSource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<String?> getTokenType();
  Future<void> deleteToken();
}

class AuthSecureStorageDataSourceImpl implements AuthSecureStorageDataSource {
  final SecureStorageService _secureStorageService;

  static const _tokenKey = 'AUTH_TOKEN';
  static const _tokenType = 'AUTH_TOKEN_TYPE';

  AuthSecureStorageDataSourceImpl(this._secureStorageService);

  @override
  Future<void> saveToken(String token) async {
    await _secureStorageService.saveItem(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _secureStorageService.getItem(key: _tokenKey);
  }

  @override
  Future<String> getTokenType() async {
    return await _secureStorageService.getItem(key: _tokenType) ?? "Bearer";
  }

  @override
  Future<void> deleteToken() async {
    await _secureStorageService.deleteItem(key: _tokenKey);
  }
}
