import 'package:jwt_decoder/jwt_decoder.dart';

class AuthUser {
  final String access;
  final String refresh;
  final String? email;
  final String? displayName;

  AuthUser({
    required this.access,
    required this.refresh,
    this.email = '',
    this.displayName = '',
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    print(json);
    final jwt = JwtDecoder.decode(json['access']);
    print(jwt);
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
