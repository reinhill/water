

import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';

class FoodDetails extends StatefulWidget {
  final int index;
  final String image, name, time, level;
  FoodDetails(this.index, this.image, this.name, this.time, this.level);

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  bool liked = false;
  int selectedIndex = 0; 
  List tabs = [ "Procedure", "Ingredients"];


  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: cPrimaryColor,
      body: SingleChildScrollView(
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
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: liked ? Colors.red.withOpacity(.5) : cLightGreyColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: IconButton(
                        icon: liked
                            ? (Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ))
                            : (Icon(Icons.favorite_border)),
                        onPressed: () {
                          setState(() => liked = !liked);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Hero(
                  
                  tag: "tag${widget.index}",
                  child: Image.asset(widget.image, fit: BoxFit.contain,
                   ),
                ),
                Positioned(
                  top: 75.0,
                  right: 25.0,
                  child: Image.asset("assets/images/coriander.png",
                      height: 85, fit: BoxFit.contain),
                ),
                Positioned(
                  top: 75.0,
                  left: 25.0,
                  child: Image.asset("assets/images/coriander.png",
                      height: 85, fit: BoxFit.contain),
                ),
              ],
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
                        widget.name,
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
                                color:cAccentColor,
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
                            Text(
                              "${widget.time} Minutes",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: cLightbackColor,
                                  fontWeight: FontWeight.w600),
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
                            Text(
                              "${widget.level} Level",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: cLightbackColor,
                                  fontWeight: FontWeight.w600),
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
                        color:cPrimaryColor,
                        borderRadius: BorderRadius.circular(36.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(tabs.length, 
                      (index) => 
                      GestureDetector(
                        onTap: () => setState(() {
                          selectedIndex= index; 
                        
                        }),
                        child: Container(
                          height: 48.0,
                          width: 150.0,
                          padding: EdgeInsets.only(top: 10, bottom: 10) ,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                           border: Border.all(
                                      width: 2.0, color: selectedIndex == index? cAccentColor : Colors.transparent),
                            color: selectedIndex == index? cLightGreyColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(35.0)
                          ),
                          child: Text(tabs[index],
                          style: TextStyle(
                            fontSize: 16.0,
                            color: selectedIndex == index? cLightbackColor : cAccentColor
                          ),
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
                    selectedIndex ==0?   Container(
                      height: 150.0,
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                       padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      decoration: BoxDecoration(
                        color: cPrimaryColor,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Text(example,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: cAccentColor,
                        fontWeight: FontWeight.w400
                      ),
                      ),
                    ) 
                    : 
                    Container(
                      height: 170.0,
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                       padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                      decoration: BoxDecoration(
                        color: cPrimaryColor,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child:  Text(ingredients,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: cAccentColor,
                        fontWeight: FontWeight.w400
                      ),
                      ),

                      
                    ),



                    SizedBox(
                      height: 24.0,
                    ),
                    Column(children: [
                      Icon(Icons.keyboard_arrow_up,
                      size:28.0,
                      color: cLightbackColor,),
                      Text("Show More", 
                      style: TextStyle(
                        fontSize: 14.0,
                        color: cLightbackColor,
                        fontWeight: FontWeight.w600

                      ),)
                    ],)
      
      
                  ],
                ),
                ),
          ],
        ),
      ),
    );
  }
}
