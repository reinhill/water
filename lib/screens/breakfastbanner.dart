
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/newrecipepost.dart';
import 'package:water/screens/updatefooddetails.dart';

class BreakfastBanner extends StatefulWidget {
   const BreakfastBanner({super.key});
  @override
  State<BreakfastBanner> createState() => _BreakfastBannerState();
}

class _BreakfastBannerState extends State<BreakfastBanner> {
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
                      image: AssetImage('assets/images/makeahead.jpg'),
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
              "Make-Ahead Egg and Cheese Sandwich",
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
                        "20",
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
                        "Medium",
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
                      "Step 1 \nIn a bowl, beat eggs with 1 Tbsp water and ¼ tsp each salt and pepper. Heat oil in a large non stick skillet on medium heat. \nStep 2 \nAdd eggs and cook, stirring with a rubber spatula every few seconds, to desired doneness — 2 to 3 minutes for medium soft eggs. \nStep 3 \nSpoon onto bottom half of each muffin and top with cheese, spinach, and ham (if using). Sandwich with remaining muffin top.",
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
                      "4 large eggs \nKosher salt and pepper \n1 tbsp. olive oil \n2 oz. extra-sharp cheddar cheese, coarsely grated \n4 English muffins, toasted \n2 c. baby spinach \n4 thin slices ham (optional)",
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
