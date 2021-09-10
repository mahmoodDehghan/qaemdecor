import 'package:flutter/material.dart';

class Constructors_slide_Page extends StatelessWidget {
  const Constructors_slide_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/b.jpg',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Color.fromRGBO(20, 6, 6, .7), BlendMode.hardLight),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 600,
              child: Text(
                'با بیش از پنج سال سابقه همکاری با سازندگان و شرکت های ساختمان سازی',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontFamily: 'IranSans',
                    fontStyle: FontStyle.italic,
                    height: 2,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                  width: 110,
                  height: 110,
                  child: Image.asset('assets/images/lt.png')),
            ),
          ),
        ],
      ),
    );
  }
}
