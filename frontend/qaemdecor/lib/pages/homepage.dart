import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:qaemdecor/helper/custom_oauth_client.dart';
import 'package:qaemdecor/widgets/home_fullslider.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> getToken() async {
    var client = CustomOAuthClient(
      redirectUri: 'http://localhost:8001/',
      customUriScheme: 'qaemdecor:/',
    );
    var oAuthHelper = OAuth2Helper(
      client,
      grantType: OAuth2Helper.AUTHORIZATION_CODE,
      clientSecret:
          'cei1F6px9Zl5Qo3ENeNWfkwXMKHm9jRzN7W01TCgtJSVsV8GUjk8duDI6UE4HkUQ6GUsYPH8Qx7wO8lcpIjKUGoZ4GiqajyaJH09hT2HXNlBMY5AcxW2xMjrQrPzaMg4',
      clientId: 'F7gtwD0T9J1jEGqrPQTs0eGt6rQgfjjTnv50U7wM',
      scopes: ['read', 'write'],
    );
    var token = await oAuthHelper.getToken();
    print(token);
    print(await oAuthHelper.refreshToken(token!.refreshToken!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(html.window.location.href),
      ),
      body: FullPageSlider(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getToken();
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
