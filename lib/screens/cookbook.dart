import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/screens/addrecipe.dart';

class CookBook extends StatefulWidget {
  const CookBook({super.key});

  @override
  State<CookBook> createState() => _CookBookState();
}

class _CookBookState extends State<CookBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor,
      appBar: AppBar(
        backgroundColor: cLightGreyColor,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back_ios_rounded,
        //     color: cLightbackColor,
        //   ),
        //   onPressed: () {
              
        //   },
        // ),
        title: const Text(
          'My Cookbook',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: cLightbackColor,
            letterSpacing: 1,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_outlined,
              color: cLightbackColor,
            ),
            onPressed: () {
               Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddRecipe(),
                          ),
                        );
            },
          ),
        ],
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(children: [
        Container(
          height: 240,
          child: Stack(
            children: [
              Positioned(
                  top: 25,
                  left: 25,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      height: 205.0,
                      width: 375,
                      decoration: BoxDecoration(
                        color: cLightbackColor,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 1.0, color: cAccentColor),
                        boxShadow: [
                          BoxShadow(
                              color: cLightGreyColor,
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              offset: Offset(2.0, 7.0)),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  top: 33,
                  left: 35,
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      height: 180,
                      width: 150,
                      decoration: BoxDecoration(
                        
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/21.JPG"),),
                              ),
                    ),
                  )),
              Positioned(
                  top: 55,
                  left: 210,
                  child: Container(
                    width: 150,
                    height: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Penne Chicken Carbonara",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: cAccentColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: cAccentColor,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.all(3.0),
                                margin: EdgeInsets.only(right: 6.0),
                                decoration: BoxDecoration(
                                  color: cAccentColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Icon(
                                  Icons.timer_outlined,
                                  size: 23,
                                  color: cLightbackColor,
                                )),
                            Text(
                              '40 mins',
                              style: TextStyle(
                                  color: cnewLightGreyColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.all(3.0),
                                margin: EdgeInsets.only(right: 6.0),
                                decoration: BoxDecoration(
                                  color: cAccentColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Icon(
                                  Icons.local_fire_department_outlined,
                                  size: 23,
                                  color: cLightbackColor,
                                )),
                            Text(
                              'Easy Level',
                              style: TextStyle(
                                  color: cnewLightGreyColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        Container(
          height: 240,
          child: Stack(
            children: [
              Positioned(
                  top: 25,
                  left: 25,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      height: 205.0,
                      width: 375,
                      decoration: BoxDecoration(
                        color: cLightbackColor,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 1.0, color: cAccentColor),
                        boxShadow: [
                          BoxShadow(
                              color: cLightGreyColor,
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                              offset: Offset(2.0, 7.0)),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  top: 33,
                  left: 35,
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Container(
                      height: 180,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/images/chik.jpg"))),
                    ),
                  )),
              Positioned(
                  top: 60,
                  left: 210,
                  child: Container(
                    width: 150,
                    height: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Baked Chicken",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: cAccentColor),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: cAccentColor,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.all(3.0),
                                margin: EdgeInsets.only(right: 6.0),
                                decoration: BoxDecoration(
                                  color: cAccentColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Icon(
                                  Icons.timer_outlined,
                                  size: 23,
                                  color: cLightbackColor,
                                )),
                            Text(
                              '30 mins',
                              style: TextStyle(
                                  color: cnewLightGreyColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.all(3.0),
                                margin: EdgeInsets.only(right: 6.0),
                                decoration: BoxDecoration(
                                  color: cAccentColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Icon(
                                  Icons.local_fire_department_outlined,
                                  size: 23,
                                  color: cLightbackColor,
                                )),
                            Text(
                              'Easy Level',
                              style: TextStyle(
                                  color: cnewLightGreyColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
