import 'package:flutter/material.dart';

class CustomerReviewsSlidePage extends StatelessWidget {
  const CustomerReviewsSlidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Stack(
        children: [
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
