import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/users.dart';
import 'package:water/screens/addrecipe.dart';
import 'package:water/screens/addrecipePrac.dart';
import 'package:water/screens/fooddetailsPrac.dart';

import '../components/newrecipepost.dart';

class CookBookPrac extends StatefulWidget {
  const CookBookPrac({super.key});

  @override
  State<CookBookPrac> createState() => _CookBookPracState();
}

class _CookBookPracState extends State<CookBookPrac> {
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
                  builder: (context) => AddRecipePrac(),
                ),
              );
            },
          ),
        ],
        elevation: 0,
        centerTitle: true,
      ),
      body: StreamBuilder<List<NewRecipePost>>(
        stream: readNewRecipePost(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;

            return ListView(
              children: users.map(newrecipepost).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget newrecipepost(NewRecipePost newRecipe) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailsPrac(
                newrecipePost: newRecipe,
              ),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            builRecipe(newRecipe),
          ],
        ),
      );

  Widget builRecipe(NewRecipePost newRecipe) => Container(
        height: 240,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -12.0,
              left: -5.0,
              child: Image.asset("assets/images/coriander.png",
                  height: 95, fit: BoxFit.contain),
            ),
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
                          fit: BoxFit.cover,
                          image: NetworkImage(newRecipe.newrecipeimg)),
                    ),
                  ),
                )),
            Positioned(
                top: 45,
                left: 210,
                child: Container(
                  width: 150,
                  height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newRecipe.newrecipename,
                        overflow: TextOverflow.ellipsis,
                         maxLines: 2,
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
                          Row(
                            children: [
                              Text(
                                newRecipe.newrecipetime,
                                style: TextStyle(
                                    color: cnewLightGreyColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.end,
                              ),
                              Text(
                                " minutes",
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
                          Row(
                            children: [
                              Text(
                                newRecipe.newrecipelevel,
                                style: TextStyle(
                                    color: cnewLightGreyColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.end,
                              ),
                              Text(
                                " Level",
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
                      SizedBox(
                        height: 5,
                      ),
                      starsyellow(newRecipe.rate),
                    ],
                  ),
                ))
          ],
        ),
      );
      Widget starsyellow(i) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int x = 0; x < i; x++)
            const Icon(
              Icons.star,
              color: Colors.yellow,
              size: 20,
            ),
          for (int y = 0; y < 5 - i; y++)
            const Icon(
              Icons.star,
              color: Colors.grey,
              size: 20,
            ),
        ],
      );

  final users = FirebaseAuth.instance.currentUser!;
  Stream<List<NewRecipePost>> readNewRecipePost() => FirebaseFirestore.instance
      .collection('NewRecipe')
      .doc(users.uid)
      .collection('userNewRecipePost')
      .where('userId', isEqualTo: users.uid)
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map(
              (doc) => NewRecipePost.fromJson(
                doc.data(),
              ),
            )
            .toList(),
      );

 
}
