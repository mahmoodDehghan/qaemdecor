import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oauth2_client/oauth2_helper.dart';
import 'package:qaemdecor/helper/custom_oauth_client.dart';
import 'package:qaemdecor/providers/prefrences_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPage extends HookConsumerWidget {
  static const routeName = 'adminPage';
  const AdminPage({Key? key}) : super(key: key);

  Future<void> getToken(WidgetRef ref, bool remember) async {
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
    var pref = await ref.read(prefrencesProvider.future);
    if(remember) {
      pref.setBool('RememberLogin', true);
      pref.setString('adminToken',token!.accessToken!);
    } else {
      pref.setBool('RememberLogin', false);
      pref.remove('adminToken');
    }

    
    print(token!.accessToken);
    
    // print(await oAuthHelper.refreshToken(token!.refreshToken!));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prefrences = ref.watch(prefrencesProvider);
    final remember = useState(false);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(12, 12, 12, 1),
            Color.fromRGBO(20, 6, 6, 1),
            Color.fromRGBO(30, 0, 0, 1)
          ],
          begin: Alignment.bottomRight,
          stops: [0.0, 0.7, 1.0],
          end: Alignment.topLeft,
        ),
      ),
        child: prefrences.when(data: (SharedPreferences pref){
          bool? isRemember = pref.getBool("RememberLogin");
          if(isRemember!=null && isRemember==true)
            if(pref.getString('adminToken')!=null)
              return Text('You are already logged in!');
          return Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                      onPrimary: Colors.white,
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IranSans',
                      )                      
                    ),
                    onPressed: (){
                    getToken(ref, remember.value);
                  }, child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('ورود'),
                  ),),
                  SizedBox(height: 20.0,),
                  Row(children: [
                    Text('مرا به خاطر بسپار',style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IranSans',
                      )),
                    Checkbox(
                    value: remember.value, 
                    onChanged: (checked)=> remember.value=checked!,
                    fillColor: MaterialStateProperty.all(Colors.amber),
                    )
                  ],)
                ],
              ),
            ),
          );    
        }, loading: ()=>CircularProgressIndicator(), error: (err, stack) => Text('Error: $err'),),
      ),
    );
  }
}