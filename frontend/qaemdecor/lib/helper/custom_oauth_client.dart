import 'package:oauth2_client/oauth2_client.dart';

class CustomOAuthClient extends OAuth2Client {
  CustomOAuthClient({
    required String redirectUri,
    required String customUriScheme,
  }) : super(
          authorizeUrl: 'http://127.0.0.1:8000/o/authorize/',
          tokenUrl: 'http://127.0.0.1:8000/o/token/',
          redirectUri: redirectUri,
          customUriScheme: customUriScheme,
          refreshUrl: 'http://127.0.0.1:8000/o/token/',
          revokeUrl: 'http://127.0.0.1:8000/o/revoke_token/',
        );
}
