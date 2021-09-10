import 'package:flutter/material.dart';
import 'package:qaemdecor/models/main_rout_path.dart';

class MainRouterInformationParser extends RouteInformationParser<MainRoutePath>{
  Map<String,Widget> routes;
  MainRouterInformationParser({required this.routes}):super();
  @override
  Future<MainRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if(uri.pathSegments.length == 0) {
      return MainRoutePath.home();
    }

    if(uri.pathSegments.length==1) {
      var routeName = uri.pathSegments[0];
      if(!routes.keys.contains(routeName))
        return MainRoutePath.unknown();
      return MainRoutePath.page(routeName);
    }
    return MainRoutePath.unknown();
  }
  
  @override
  RouteInformation? restoreRouteInformation(MainRoutePath path) {
    if(path.isUnknown) {
      return RouteInformation(location:'/notfound');
    }
    if(path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if(path.isOtherPages) {
      return RouteInformation(location: '/${path.pathName}');
    }
    return null; 
  }
}