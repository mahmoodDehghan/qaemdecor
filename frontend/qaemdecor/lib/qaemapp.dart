import 'package:flutter/material.dart';
import 'package:qaemdecor/pages/testpage.dart';
import 'package:qaemdecor/routers/Main_router_information_parser.dart';
import 'package:qaemdecor/routers/main_router_delegate.dart';
import './pages/admin_page.dart';
// import './pages/homepage.dart';
// import './pages/testpage.dart';

class QaemDecorApp extends StatelessWidget {
  QaemDecorApp({Key? key}) : super(key: key);

  final Map<String,Widget> legalRoutes = {
    TestPage.routeName: TestPage(),
    AdminPage.routeName: AdminPage(),
  }; 

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(primary: Colors.black26),
      ),
      routeInformationParser: MainRouterInformationParser(routes: this.legalRoutes),
      routerDelegate: MainRouterDelegate(routes: legalRoutes),
      // routes: {
      //   HomePage.routeName: (ctx) => HomePage(),
      //   TestPage.routeName: (ctx) => TestPage(),
      // },
      // initialRoute: TestPage.routeName,
    );
  }
}
