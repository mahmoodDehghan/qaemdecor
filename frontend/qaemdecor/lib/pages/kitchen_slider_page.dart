import 'package:flutter/material.dart';

class KitchenSlidePage extends StatelessWidget {
  const KitchenSlidePage({Key? key}) : super(key: key);

  Widget picCoverPart() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/1.bmp',
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget sampleRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 10,
          height: MediaQuery.of(context).size.width / 10,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/1.bmp',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.orangeAccent,
                width: 5,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 10,
          height: MediaQuery.of(context).size.width / 10,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/1.bmp',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.orangeAccent,
                width: 5,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 10,
          height: MediaQuery.of(context).size.width / 10,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/1.bmp',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.orangeAccent,
                width: 5,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 10,
          height: MediaQuery.of(context).size.width / 10,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/1.bmp',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.orangeAccent,
                width: 5,
              ),
            ),
          ),
        ),
      ],
    );
  }

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
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: picCoverPart(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              verticalDirection: VerticalDirection.up,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 30.0, 30.0),
                    child: sampleRow(context),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      Center(
                        child: SizedBox(
                          width: 300,
                          child: Text(
                            'ساخت و بازسازی دکوراسیون آشپزخانه مدرن و کلاسیک',
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
