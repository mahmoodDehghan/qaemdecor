import 'package:flutter/material.dart';
import 'package:qaemdecor/pages/cabinandliving_slider_page.dart';
import 'package:qaemdecor/pages/contact_us_order_page.dart';
import 'package:qaemdecor/pages/contructors_slider_page.dart';
import 'package:qaemdecor/pages/design_slider_page.dart';
import 'package:qaemdecor/pages/kitchen_slider_page.dart';
import 'package:qaemdecor/pages/storedecor_slider_page.dart';

class FullPageSlider extends StatelessWidget {
  const FullPageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      pageSnapping: false,
      children: [
        KitchenSlidePage(),
        LivingRoomCabinPage(),
        DecorSliderPage(),
        Constructors_slide_Page(),
        DesignsSliderPage(),
        ContactUsPage(),
      ],
    );
  }
}
