import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/newrecipepost.dart';
import 'package:water/components/users.dart';
import 'package:water/screens/fooddetailsPrac.dart';
import 'package:water/screens/profilescreen.dart';


class Fav extends StatefulWidget {
  const Fav({super.key});

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
final users = FirebaseAuth.instance.currentUser!;
 late bool favorite = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor,
    
      body: ListView(
        children: [
          read(users.uid),
          fetchBody(),
        ],
      )
      
    );
  }

  Widget fetchBody() {
    return StreamBuilder<List<NewRecipePost>>(
      stream: readNewRecipePost(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong! ${snapshot.error}');
        } else if (snapshot.hasData) {
          final manwha = snapshot.data!;

            return ListView(
              shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(),
            children: manwha.map(newrecipepost).toList(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  Widget newrecipepost(NewRecipePost newRecipePost) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailsPrac(
                newrecipePost: newRecipePost,
              ),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildRecipe(newRecipePost),
          ],
        ),
      );

  Widget buildRecipe(NewRecipePost newRecipePost) => SingleChildScrollView(
    child: Container(
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
                            image: NetworkImage(newRecipePost.newrecipeimg)),
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
                          newRecipePost.newrecipename,
                          overflow: TextOverflow.ellipsis,
                           maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: cAccentColor),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Divider(
                          color: cAccentColor,
                        ),
                        SizedBox(
                          height: 1,
                        ), Row(
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
                                newRecipePost.newrecipetime,
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
                                newRecipePost.newrecipelevel,
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
                          height: 3,
                        ),
                        
                        SizedBox(
                          height: 8,
                        ),
                         starsyellow(newRecipePost.rate),
                      
                      ],
                    ),
                  )),
                   Positioned(
                    top: 168,
                        right: 35,
                        left:50,
                         child: Container(
                          child: 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                            GestureDetector(
                                   onTap: () {},
                                   child: Container(
                                     padding: EdgeInsets.all(0),
                                     decoration: BoxDecoration(
                                       color: (!newRecipePost.isLiked)
                                           ? cLightGreyColor
                                           : Colors.red.withOpacity(.5),
                                       borderRadius: BorderRadius.circular(20.0),
                                     ),
                                     child: IconButton(
                                       icon: (!newRecipePost.isLiked)
                                           ? (Icon(Icons.favorite_border))
                                           : (Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )),
                                       onPressed: () {
                                         setState(() {
                                           if (!newRecipePost.isLiked) {
                          newRecipePost.isLiked = true;
                          updateFav(newRecipePost.newrecipepost_id, true);
                       
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
                          newRecipePost.isLiked = false;
                          updateFav(newRecipePost.newrecipepost_id, false);
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
                          ],)
                         ),
                       )
            ],
          ),
        ),
  );
        Widget buildUppername(Users user) =>
   Padding(
     padding: const EdgeInsets.all(25.0),
     child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         
          Text.rich(
                          TextSpan(
                            children: [
                            
                              TextSpan(
                                text: user.nickname,
                                style: TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w800,
                                  color: cAccentColor,
                                ),
                              ),
                                TextSpan(
                                text: " favorites",
                                style: TextStyle(
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w800,
                                  color: cAccentColor,
                                ),
                              ),
                              TextSpan(
                                text: "\nSee all your favorite recipes here!",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: cLightGreyColor,
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        GestureDetector(
                        onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Profile(),
                                    ),
                                  ),
                        child: Container(
                          decoration: BoxDecoration(
                          ),
                          child: Stack(
                            children: [
                              Container(
                        decoration: BoxDecoration(),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(),
                            height: 60,
                            child: CircleAvatar(
                              maxRadius: 30.0,
                              minRadius: 30.0,
                              backgroundColor: cAccentColor,
                              backgroundImage: NetworkImage(user.image)
                            ),
                          ),
                          
                          ],
                        ),
                      ),
                            
                            ],
                          ),
                        ),
                      )



        ],
      ),
   );

  Stream<List<NewRecipePost>> readNewRecipePost() =>
      FirebaseFirestore.instance
      .collection('NewRecipe')
      .doc(users.uid)
      .collection('userNewRecipePost')
      .where("isLiked", isEqualTo: true).snapshots().map(
            (snapshot) => snapshot.docs
                .map(
                  
                  (doc) => NewRecipePost.fromJson(
                    doc.data(),
                  ),
                )
                .toList(),
          );
  Widget read(uid) {
    var collection = FirebaseFirestore.instance.collection('Users');
    return Column(
      children: [
        SizedBox(
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: collection.doc(uid).snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');

              if (snapshot.hasData) {
                final users = snapshot.data!.data();
                final newUser = Users(
                  id: users!['id'],
                  nickname: users['name'],
                  age: users['age'],
                  password: users['password'],
                  email: users['email'],
                  image: users['image']
                );

                return buildUppername(newUser);
                
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
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
final user = FirebaseAuth.instance.currentUser!;
 updateFav(String id, bool status) {
    final docUser = FirebaseFirestore.instance
   .collection('NewRecipe')
    .doc(users.uid)
    .collection('userNewRecipePost')
    .doc(id);
    docUser.update({
      'isLiked': status,
    });
 }
  
}