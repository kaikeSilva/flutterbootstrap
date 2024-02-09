import 'package:jwt_decoder/jwt_decoder.dart';

class AuthUser {
  final String access;
  final String refresh;
  final String? email;
  final String? displayName;
  final String? password;

  AuthUser({
    required this.access,
    required this.refresh,
    this.email = '',
    this.displayName = '',
    this.password = '',
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    final jwt = JwtDecoder.decode(json['access']);
    return AuthUser(
      access: json['access'],
      refresh: json['refresh'],
      email: json['email'] ?? '',
      displayName: json['displayName'] ?? jwt['username'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'access': access,
      'refresh': refresh,
      'email': email,
      'displayName': displayName,
    };
  }
}
