import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:water/components/bottomnavbar.dart';
import 'package:water/components/constnt.dart';
import 'package:water/screens/loginsignup.dart';
import 'package:water/screens/updateprofile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        backgroundColor: cPrimaryColor,
        appBar: AppBar(
          backgroundColor: cLightGreyColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: cLightbackColor,
            ),
            onPressed: () {
                Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NavBar(),
                          ),
                        );
            },
          ),
          title: Text(
            'P r o f i l e',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: cLightbackColor,
              letterSpacing: 1,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: cLightbackColor,
              ),
              onPressed: () {
                Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UpdateProfile(),
                          ),
                        );
              },
            ),
          ],
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                              color: cLightGreyColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(150.0),
                                  bottomRight: Radius.circular(0.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  child: CircleAvatar(
                                    maxRadius: 70.0,
                                    minRadius: 70.0,
                                    backgroundColor: cAccentColor,
                                    backgroundImage: AssetImage(
                                      "assets/images/avatar.png",
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(
                                      top: 15.0, right: 15.0, bottom: 15.0, left: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        user.email!,
                                        style: TextStyle(
                                            color: cLightbackColor,
                                            fontSize: 28,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        user.email!,
                                        style: TextStyle(
                                            color: cLightFontColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: <Widget>[
                          CardItem(Icons.card_membership_outlined, "User ID", "user.id"),
                          CardItem(Icons.person_outline, "Nickname","user.nickname"),
                          CardItem(Icons.email_outlined , "Email","user.email"),
                          CardItem(Icons.fingerprint_outlined, "Password","user.password"),
                          CardItem(Icons.numbers, "Age","user.age"),
          
          
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: ElevatedButton(
                              onPressed: () {
                                 FirebaseAuth.instance.signOut();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: cAccentColor,
                                shape: RoundedRectangleBorder(
                                    //to set border radius to button
                                    borderRadius: BorderRadius.circular(30)),
                                minimumSize: const Size.fromHeight(50),
                              ),
                              child: const Text(
                                'Log Out',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),]
        ));
  }

  Padding CardItem(IconData icon, String titleText, String subtitle) {
    return Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 8),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              icon,
                              size: 38.0,
                              color: cAccentColor,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                titleText,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                subtitle,
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15.0),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
  }
  
}
