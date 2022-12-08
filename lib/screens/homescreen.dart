

import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/screens/fooddetails.dart';
import 'package:water/screens/profilescreen.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int currentIndex = 0;

  // final pagescreens = [
  //   HomeScreen(),
  //   Profile(),
  //   CookBook(),
  //   GroceryList()
  // ];
  
  

  List categoryList = [ 
    {"image" : "assets/images/garlicshrimpspag.png", 
     "name" : "Dinner", },
     {"image" : "assets/images/pancake.png", 
     "name" : "Breakfast", },
     {"image" : "assets/images/cupcake.png", 
     "name" : "Snack", },
     {"image" : "assets/images/koreanbeefsoup.png", 
     "name" : "Lunch", },
     
  ];

  List dinnerList = [
    {"image" : "assets/images/pennechickencarbonara.png", 
     "name" : "Penne Chicken Carbonara",
     "time" : "40", 
     "level" : "Easy",},
     {"image" : "assets/images/spaghetti.png", 
     "name" : "Spaghetti",
     "time" : "60",
     "level" : "Hard" },
     {"image" : "assets/images/koreanbeefsoup.png", 
     "name" : "Korean Beef Soup",
     "time" : "30",
     "level" : "Medium" },
     {"image" : "assets/images/salmon.png", 
     "name" : "Salmon with Lentil Salad",
     "time" : "15",
     "level" : "Easy" },
    
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: cPrimaryColor,
     
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 55.0, bottom: 32.0, left: 32.0, right: 32.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Welcome!",
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w800,
                              color: cAccentColor,
                            ),
                          ),
                          TextSpan(
                            text: "\nReady to cook for dinner?",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: cLightGreyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Profile(),
                                  ),
                                ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: cAccentColor,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/cupcake.png",
                              height: 50,
                              width: 50,
                            ),
                            Positioned(
                              top: -0.1,
                              right: -0.1,
                              child: Container(
                                height: 15.0,
                                width: 15.0,
                                decoration: BoxDecoration(
                                    color: Colors.purple,
                                    borderRadius: BorderRadius.circular(30.0),
                                    border: Border.all(
                                        width: 1.0, color: cLightbackColor)),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: cColor6,
                      blurRadius: 30.0,
                      spreadRadius: -35.0,
                      blurStyle: BlurStyle.normal,
                      offset: Offset(5, 10)),
                ],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Stack(
                
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35.0),
                    child: Image.asset(
                      'assets/images/food-wallpaper.jpg',
                      height: 200,
                      width: 450,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(230, 30, 15, 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Menu for dinner',
                          style: TextStyle(
                            color: cLightFontColor,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.end,
                        ),
                    
                        Text(
                          'Baked Chicken',
                          style: TextStyle(
                              color: cColor5,
                              fontSize: 25,
                              fontWeight: FontWeight.w900),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.all(0.0),
                                margin: EdgeInsets.only(right: 6.0),
                                decoration: BoxDecoration(
                                  color: cColor5,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Icon(Icons.timer_outlined, size: 23, )),
                            Text(
                              '30 mins',
                              style: TextStyle(
                                  color: cColor5,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.all(0.0),
                                margin: EdgeInsets.only(right: 6.0),
                                decoration: BoxDecoration(
                                  color: cColor5,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Icon(Icons.local_fire_department_outlined, size: 23, )),
                            Text(
                              'Easy Level',
                              style: TextStyle(
                                  color: cColor5,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.0, right: 32.0, left: 32.0, ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Meal Category',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                  color: cAccentColor
                )),  
              ],),
            ),
      
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: 
                Padding(
                  padding: const EdgeInsets.only(left: 15.0 ),
                  child: Row(
                    children: 
                  List.generate(categoryList.length, (index) => 
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: GestureDetector(
                      onTap: () => 
                      setState(() {
                        currentIndex = index;
                        
                      }),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0,),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                          decoration: BoxDecoration( color: currentIndex == index? cLightGreyColor: Colors.purple.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all( width: 1.0, color: currentIndex == index? cLightbackColor : cLightGreyColor )),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 16.0),
                                 padding: EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: currentIndex == index? Colors.transparent :Colors.transparent,
                                  borderRadius:  BorderRadius.circular(8.0)
                                ),
                                child: Image.asset(categoryList[index]["image"],
                                height: 36.0,
                                width: 36.0, 
                                fit: BoxFit.contain,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Text(categoryList[index]["name"],
                                style: TextStyle(fontSize:20.0,
                                fontWeight: FontWeight.w800,
                                color: currentIndex == index? cLightbackColor : cColor6 ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right:16.0, bottom:16.0 ),
                child: GridView.builder( 
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 60.0,
                    crossAxisSpacing: 0.0
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(top: 44.0),
                  itemCount: dinnerList.length,
                  itemBuilder:(context, index) { 
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FoodDetails(
                          index,
                          dinnerList[index]["image"],
                          dinnerList[index]["name"],
                          dinnerList[index]["time"],
                          dinnerList[index]["level"]
                        ),
                        ),
                        ),
                      child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 200.0,
                          width: 170.0,
                          padding: EdgeInsets.only(bottom: 24.0),
                          decoration: BoxDecoration(
                            color: cLightGreyColor,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Text(dinnerList[index]['name'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: cLightFontColor,
                                ),),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: 
                                  List.generate(5, (index) => 
                                  Icon(Icons.star, color: Colors.yellow, size: 16.0,),
                                  )
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("${dinnerList[index]["time"]} \nMin ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: cLightFontColor,
                                    fontWeight: FontWeight.w400
                                  ),),
                                  Column(
                                    children: List.generate(6, (index) => Container(
                                      height: 2.0,
                                      width:2.0,
                                      margin: EdgeInsets.only(bottom:2),
                                      decoration: BoxDecoration(
                                         color: cDarkGreyFontColor,
                                         borderRadius: BorderRadius.circular(2.0)
                                    
                                      ),
                                     
                                    )),
                                    
                                  ),
                                  Text(
                                    "${dinnerList[index]["level"]} \nLevel ",
                                   textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: cLightFontColor,
                                    fontWeight: FontWeight.w400
                                  ),),
                                ],
                              )  
                            ],
                          ),
                        ),
                        Positioned(
                          top: -170.0,
                          bottom: 0.0,
                          left: 1.0,
                          right: 0.0,
                          child: Container(
                            child: Hero(
                              tag: "tag$index",
                              child: Image.asset(dinnerList[index]['image'],
                              height: 10,
                              
                              ),
                            ),
                          ),
                        )
                      ],              ),
                    ); },
                ),
              ),
          ],
        ),
      ),
    );
  }


}