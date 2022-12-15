
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/newrecipepost.dart';
import 'package:water/screens/updatefooddetails.dart';

class SnackBanner extends StatefulWidget {
   const SnackBanner({super.key});
  @override
  State<SnackBanner> createState() => _SnackBannerState();
}

class _SnackBannerState extends State<SnackBanner> {
  final users = FirebaseAuth.instance.currentUser!;
  bool liked = false;
  int selectedIndex = 0;
  List tabs = ["Procedure", "Ingredients"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor,
      body: SingleChildScrollView(
        child: Container(
          
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32.0, 64.0, 32.0, 0.0),
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: cLightGreyColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 24.0,
                      color: cLightbackColor,
                    ),
                  ),
                ),
               
              ],
      ),),Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: cAccentColor.withOpacity(0.5),
                  image: DecorationImage(
                      image: AssetImage('assets/images/trio.jpg'),
                      fit: BoxFit.cover)),
            ),
             Positioned(
              top: -50.0,
              right: -60.0,
              child: Image.asset("assets/images/coriander.png",
                  height: 120, fit: BoxFit.contain),
            ),
            Positioned(
              top: 350.0,
              left: -38.0,
              child: Image.asset("assets/images/coriander.png",
                  height: 85, fit: BoxFit.contain),
            ),
           
            
          ],
        ),
      ),
      Container(
      //height: 400.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 28.0),
      padding: EdgeInsets.symmetric(vertical: 28.0),
      decoration: BoxDecoration(
          color: cLightGreyColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          )),
      child: Column(
        children: [
          Container(
            height: 4.0,
            width: 28.0,
            margin: EdgeInsets.only(bottom: 32.0),
            decoration: BoxDecoration(
              color: cAccentColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              "Trio of Cheese Balls",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: cLightbackColor,
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 32.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(right: 6.0),
                    decoration: BoxDecoration(
                      color: cAccentColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          color: cLightbackColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "25",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: cLightbackColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        " Minutes",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: cLightbackColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "Cooking",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: cLightFontColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                children: List.generate(
                    12,
                    (index) => Container(
                          height: 2.0,
                          width: 2.0,
                          margin: EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                              color: cLightbackColor,
                              borderRadius: BorderRadius.circular(2.0)),
                        )),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(right: 6.0),
                    decoration: BoxDecoration(
                      color: cAccentColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.star_outline,
                          color: cLightbackColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "5.0",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: cLightbackColor,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "Rating",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: cLightFontColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                children: List.generate(
                    12,
                    (index) => Container(
                          height: 2.0,
                          width: 2.0,
                          margin: EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                              color: cLightbackColor,
                              borderRadius: BorderRadius.circular(2.0)),
                        )),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(right: 6.0),
                    decoration: BoxDecoration(
                      color: cAccentColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.local_fire_department_outlined,
                          color: cLightbackColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Easy",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: cLightbackColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        " Level",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: cLightbackColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "Recipes",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: cLightFontColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 32.0,
          ),
          /////////////////////////tabs/////////////////
          Container(
            margin: EdgeInsets.symmetric(horizontal: 45.0),
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            //padding: EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
                color: cPrimaryColor,
                borderRadius: BorderRadius.circular(36.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                tabs.length,
                (index) => GestureDetector(
                  onTap: () => setState(() {
                    selectedIndex = index;
                  }),
                  child: Container(
                    height: 48.0,
                    width: 150.0,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0,
                            color: selectedIndex == index
                                ? cAccentColor
                                : Colors.transparent),
                        color: selectedIndex == index
                            ? cLightGreyColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(35.0)),
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                          fontSize: 16.0,
                          color: selectedIndex == index
                              ? cLightbackColor
                              : cAccentColor),
                    ),
                  ),
                ),
              ),
            ),
          ),
          /////////////////////////deatils/////////////////
          SizedBox(
            height: 32.0,
          ),
          selectedIndex == 0
              ? Container(
                  height: 300.0,
                  width: 400,
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    color: cPrimaryColor,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      "Step 1 \n Everything Cheese Ball: Combine sesame seeds, poppy seeds, dried onion flakes, black pepper, and salt. \nStep 2 \nWith mixer, beat cream cheese with 2 tablespoons seasoning mixture. By 2-tablespoon portions, scoop and roll into balls. Roll in remaining seasoning mixture, pressing to coat.",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: cAccentColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              : Container(
                  height: 300.0,
                  width: 400,
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    color: cPrimaryColor,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      "1/4 c. sesame seeds \n2 tbsp. poppy seeds \n2 tbsp. dried onion flakes \n2 tsp. coarsely ground black pepper \n1/4 tsp. salt \n2 8-oz. bricks reduced-fat cream cheese",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: cAccentColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
          
         
        ],
      ),
    )



            ],
          ),
        ),
      ),
    );
  }

}
