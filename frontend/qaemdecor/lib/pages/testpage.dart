import 'package:flutter/material.dart';
import 'package:qaemdecor/widgets/logo_image_widget.dart';
import 'package:qaemdecor/widgets/main_menu_widget.dart';
// import 'package:qaemdecor/widgets/slide_type_select_widget.dart';

class TestPage extends StatelessWidget {
  static const routeName = 'testPage';
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Column(
          children: [
            LogoImageWidget(),
            MainMenuWidget(),
          ],
        ),
      ),
    );
  }
}
