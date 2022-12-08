import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:water/components/bottomnavbar.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/users.dart';
import 'package:water/screens/updateprofile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
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
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      read(user.uid),
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget imgExist(Users user) => CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(user.image),
      );

  Widget imgNotExist() => const Icon(
        Icons.account_circle_rounded,
        size: 40,
      );

  Widget buildProfile(Users user) => Padding(
        padding: EdgeInsets.only(left: 1.0, right: 1.0, ),
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
                          SizedBox(
                            width: 13,
                          ),
                          Container(
                            height: 200,
                            child: CircleAvatar(
                              maxRadius: 60.0,
                              minRadius: 60.0,
                              backgroundColor: cAccentColor,
                              backgroundImage: NetworkImage(user.image )
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 15.0, right: 15.0, bottom: 15.0, left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                
                                Text(
                                  user.nickname,
                                  style: TextStyle(
                                      color: cLightbackColor,
                                      fontSize: 35,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  user.email,
                                  style: TextStyle(
                                      color: cLightbackColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal),
                                ),
                               
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                       Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                          Icons.card_membership_outlined,
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
                            "User ID",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            user.id,
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
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                          Icons.face_outlined,
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
                            "Nickname",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            user.nickname,
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
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                          Icons.email_outlined,
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
                            "Email",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            user.email,
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
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                          Icons.fingerprint_outlined,
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
                            "Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            user.password,
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
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                          Icons.numbers,
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
                            "Age",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            user.age,
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

                    ],
                  ),
                )
           
          ],
        ),
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

                return buildProfile(newUser);
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
  
}
