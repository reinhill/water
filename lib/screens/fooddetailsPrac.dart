import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/newrecipepost.dart';
import 'package:water/screens/updatefooddetails.dart';

class FoodDetailsPrac extends StatefulWidget {
  const FoodDetailsPrac({
    super.key,
    required this.newrecipePost,
  });

  final NewRecipePost newrecipePost;

  @override
  State<FoodDetailsPrac> createState() => _FoodDetailsPracState();
}

class _FoodDetailsPracState extends State<FoodDetailsPrac> {
  final users = FirebaseAuth.instance.currentUser!;
  bool liked = false;
  int selectedIndex = 0;
  List tabs = ["Procedure", "Ingredients"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor,
      body: SingleChildScrollView(
        child: buildOverall(widget.newrecipePost),
      ),
    );
  }

  Widget buildOverall(NewRecipePost newrecipePost) => Column(
        children: [
          buildButtonsabove(newrecipePost),
          buildDisplayPhoto(newrecipePost),
          buildBodyDetails(newrecipePost),
        ],
      );

  Widget buildBodyDetails(NewRecipePost newrecipePost) {
    return Container(
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
              newrecipePost.newrecipename,
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
                        newrecipePost.newrecipetime,
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
                  newrecipePost.rate.toString(),
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
                        newrecipePost.newrecipelevel,
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
                      newrecipePost.newrecipeprocedure,
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
                      newrecipePost.newrecipeingredients,
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
          
          buildButtonsBelow(newrecipePost),
        ],
      ),
    );
  }

  Widget buildButtonsBelow(NewRecipePost newrecipePost) =>
     Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodUpdate(newrecipePost: newrecipePost),
                    ),
                  );
                },
                child: Container(
                  height: 55.0,
                  width: 180,
                  padding: EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: cAccentColor),
                  child: Text(
                    "Update Recipe",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                   _showActionSheet(context, newrecipePost.newrecipepost_id);
                    
                   
                },
                
                child: Container(
                  height: 55.0,
                  width: 180,
                  padding: EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: cAccentColor),
                  child: Text(
                    "Delete Recipe",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        );
  

  Widget buildDisplayPhoto(NewRecipePost newrecipePost) => Padding(
        padding: const EdgeInsets.all(15.0),
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
                      image: NetworkImage(newrecipePost.newrecipeimg),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              top: -1.0,
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
      );

  Padding buildButtonsabove(NewRecipePost newrecipePost) {
    return Padding(
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
                color: (!newrecipePost.isLiked)
                    ? cLightGreyColor
                    : Colors.red.withOpacity(.5),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: IconButton(
                icon: (!newrecipePost.isLiked)
                    ? (Icon(Icons.favorite_border))
                    : (Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )),
                onPressed: () {
                  setState(() {
                    if (!newrecipePost.isLiked) {
                      newrecipePost.isLiked = true;
                      updateLike(newrecipePost.newrecipepost_id, true);

                      final snackbar = SnackBar(
                   duration: Duration(seconds: 1),
                   margin: const EdgeInsets.only(bottom: 0),
                   behavior: SnackBarBehavior.floating,
                   backgroundColor: Colors.transparent,
                   elevation: 0,
                   content: Container(
                     height: 60,
                    width: 40,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: cAccentColor
                    ),
                     child: Row (
                      children: [
                        SizedBox(width: 10),
                      Expanded (
                        child: Text ('You liked a recipe!',style: TextStyle(color: Colors.white,fontSize: 15)),
                      ),
                      SizedBox(width:5),

                      Icon(Icons.sentiment_very_satisfied,
                      color: Colors.white,
                      ),
                       SizedBox(width: 10),
                      ]
                      ),
                   )
                   );
                   ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      
                    } else {
                      newrecipePost.isLiked = false;
                      updateLike(newrecipePost.newrecipepost_id, false);
                      final snackbar = SnackBar(
                   duration: Duration(seconds: 1),
                   margin: const EdgeInsets.only(bottom: 0),
                   behavior: SnackBarBehavior.floating,
                   backgroundColor: Colors.transparent,
                   elevation: 0,
                   content: Container(
                     height: 60,
                    width: 40,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: cAccentColor
                    ),
                     child: Row (
                      children: [
                        SizedBox(width: 10),
                      Expanded (
                        child: Text ('You unlike a recipe',style: TextStyle(color: Colors.white,fontSize: 15)),
                      ),
                      SizedBox(width:5),

                      Icon(Icons.mood_bad,
                      color: Colors.white,
                      ),
                       SizedBox(width: 10),
                      ]
                      ),
                   )
                   );
                   ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    }
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  deleteRecipe(String id) {
     final docUser = FirebaseFirestore.instance
    .collection('NewRecipe')
    .doc(users.uid)
    .collection('userNewRecipePost')
    .doc(id);
    docUser.delete();
    final snackbar = SnackBar(
                   duration: Duration(seconds: 3),
                   margin: const EdgeInsets.only(bottom: 0),
                   behavior: SnackBarBehavior.floating,
                   backgroundColor: Colors.transparent,
                   elevation: 0,
                   content: Container(
                     height: 60,
                    width: 40,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: cAccentColor
                    ),
                     child: Row (
                      children: [
                        SizedBox(width: 10),
                      Expanded (
                        child: Text ('Recipe Deleted successfully',style: TextStyle(color: Colors.white,fontSize: 15)),
                      ),
                      SizedBox(width:5),

                      Icon(Icons.delete,
                      color: Colors.white,
                      ),
                       SizedBox(width: 10),
                      ]
                      ),
                    
                   )
                    
                   );
                   ScaffoldMessenger.of(context).showSnackBar(snackbar);
    Navigator.pop(context);
  }

  void _showActionSheet(BuildContext context, String id) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Confirmation', 
            style: TextStyle(
              color: cAccentColor,
              fontSize: 23
            )),
        message: const Text(
            'Are you sure you want to delete this recipe? Doing this will not undo any changes.', 
            style: TextStyle(
              color: cAccentColor,
              fontSize: 18
            )),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              deleteRecipe(id);
               Navigator.pop(context);
            },
            child: const Text('Continue', 
            style: TextStyle(
              color: cAccentColor)),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel',
            style: TextStyle(
              color: cAccentColor)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  updateLike(String id, bool status) {
   final docUser = FirebaseFirestore.instance
    .collection('NewRecipe')
    .doc(widget.newrecipePost.userId)
    .collection('userNewRecipePost')
    .doc(id);
    docUser.update({
      'isLiked': status,
    });
     
  }
}
