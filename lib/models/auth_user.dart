import 'package:jwt_decoder/jwt_decoder.dart';

class AuthUser {
  final String access;
  final String refresh;
  final String? username;
  final String? displayName;
  final String? password;

  AuthUser({
    required this.access,
    required this.refresh,
    this.username = '',
    this.displayName = '',
    this.password = '',
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    final jwt = JwtDecoder.decode(json['access']);
    return AuthUser(
      access: json['access'],
      refresh: json['refresh'],
      username: json['email'] ?? '',
      displayName: json['displayName'] ?? jwt['username'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access': access,
      'refresh': refresh,
      'usename': username,
      'password': password,
      'displayName': displayName,
    };
  }
}
