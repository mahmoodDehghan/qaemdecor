import 'package:flutter/material.dart';
import 'package:qaemdecor/models/main_rout_path.dart';
import 'package:qaemdecor/pages/testpage.dart';
import 'package:qaemdecor/pages/unknown_page.dart';

class MainRouterDelegate extends RouterDelegate<MainRoutePath> 
 with ChangeNotifier, PopNavigatorRouterDelegateMixin<MainRoutePath>{
  final GlobalKey<NavigatorState> navigatorKey;
  bool isUnknown = false;
  String? _currentRouteName = null;
  Map<String,Widget> routes;
  

  MainRouterDelegate({required this.routes}) : navigatorKey = GlobalKey<NavigatorState>();

  MainRoutePath get currentConfiguration {
    if(isUnknown) {
      return MainRoutePath.unknown();
    }
    return _currentRouteName==Null ? MainRoutePath.home() : MainRoutePath.page(_currentRouteName);
  }

  // Widget getPage(String routeName) {
  //   switch(routeName){
  //     case AdminPage.routeName
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
          MaterialPage(
          key:ValueKey(TestPage.routeName),
          child: TestPage(),
          ),  
        if(isUnknown)
          MaterialPage(key:ValueKey(UnknownPage.routeName),child: UnknownPage(),),
        if(_currentRouteName!=null) 
          MaterialPage(key: ValueKey(_currentRouteName!), child:routes[_currentRouteName!]!),
      ],
      onPopPage: (route, result) {
        if(!route.didPop(result)) {
          return false;
        }

        _currentRouteName = null;
        isUnknown = false;
        notifyListeners();

        return true;
      },
    );
  }


  @override
  Future<void> setNewRoutePath(MainRoutePath configuration) async{
    if(configuration.isUnknown) {
      _currentRouteName = null;
      isUnknown = true;
      return;
    }
    if(configuration.pathName==null) {
      _currentRouteName = configuration.pathName;
      isUnknown = false;
      return;
    } 
    if(!routes.keys.contains(configuration.pathName)) {
      isUnknown = true;
      return;
    }
    _currentRouteName = configuration.pathName;
    isUnknown = false;  
  }
  
}