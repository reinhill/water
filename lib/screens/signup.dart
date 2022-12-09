import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:water/components/bottomnavbar.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/users.dart';
import 'package:water/screens/login.dart';

class SignUpS extends StatefulWidget {
  const SignUpS({super.key});

  @override
  State<SignUpS> createState() => _SignUpSState();
}

class _SignUpSState extends State<SignUpS> {

  late TextEditingController nicknamecontroller;
  late TextEditingController emailcontroller;
  late TextEditingController passwordcontroller;
  late TextEditingController agecontroller;

  late String error;



  @override
  void initState() {
    super.initState();
    nicknamecontroller = TextEditingController();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    agecontroller =TextEditingController();
    error = "";
     print(emailcontroller);
  }

  @override
  void dispose() {
    agecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    agecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cAccentColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bgimage.JPG"),
                      fit: BoxFit.fill),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 90, left: 20),
                  color: Color(0xFF885A97).withOpacity(.90),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                            text: "Your Personal",
                            style: TextStyle(
                              fontSize: 28,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w600,
                              color: cAccentColor,
                            ),
                            children: [
                              TextSpan(
                                text: " Cookbook",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow,
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Start your Journey by Signing Up ",
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //add shadow to the submit button
            buildButtonHalfContainer(true),
            //main container for login page
            Stack(
              clipBehavior: Clip.none,
              children: 
                [
                  Positioned(
                top: 158.0,
                left: 315.0,
                child: Image.asset("assets/images/coriander.png",
                    height: 120, fit: BoxFit.contain),
              ),
              Positioned(
                top: 617.0,
                right: 308.0,
                child: Image.asset("assets/images/coriander.png",
                    height: 120, fit: BoxFit.contain),
              ),
                  Positioned(
                  top: 220,
                  child: Container(
                    height: 460,
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width - 40,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: cLightbackColor,
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(offset: Offset(5, 15), blurRadius: 20.0),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color:  cAccentColor,
                                        letterSpacing: 2
                                      ),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ],
                          ),
                          
                          Padding(
                            padding: EdgeInsets.only(top: 25.0, right: 10.0, left: 10.0),
                            child: TextField(
                              controller: nicknamecontroller,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.face_outlined,
                                  color: cAccentColor,
                                  size: 30,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: cAccentColor),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: cAccentColor),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                labelText: "Nickname",
                                labelStyle:
                                    TextStyle(fontSize: 17, color: cAccentColor),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: TextField(
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: cAccentColor,
                                  size: 28,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: cAccentColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: cAccentColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35.0),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.all(10),
                                  labelText: "Email",
                                  labelStyle:
                                      TextStyle(fontSize: 17, color: cAccentColor),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                            child: TextField(
                              obscureText: true,
                              controller: passwordcontroller,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.fingerprint_outlined,
                                  color: cAccentColor,
                                  size: 30,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: cAccentColor),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: cAccentColor),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                labelText: "Password",
                                labelStyle:
                                    TextStyle(fontSize: 17, color: cAccentColor),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
                            child: TextField(
                              controller: agecontroller,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.numbers_outlined,
                                  color: cAccentColor,
                                  size: 30,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: cAccentColor),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: cAccentColor),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(35.0),
                                  ),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                labelText: "Age",
                                labelStyle:
                                    TextStyle(fontSize: 17, color: cAccentColor),
                              ),
                            ),
                          ),
                           SizedBox(
                                height: 20,
                              ),
                           Padding(
                          padding:
                              const EdgeInsets.only(right: 15.0, left: 15.0),
                          child: Container(
                            child: Text(error,
                                style: TextStyle(
                                    color: cAccentColor, fontSize: 17),
                                textAlign: TextAlign.center),
                          ),
                        ),

                          
                              Container(
                                width: 250,
                                margin: EdgeInsets.only(top: 20),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    text: "By Pressing 'Submit' you agree to our",
                                    style: TextStyle(
                                      color: cDarkColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " terms & conditions",
                                        style: TextStyle(
                                          color: cAccentColor,
                                          fontWeight: FontWeight.bold
                                        )
                                      )
                                    ]
                                  )),
                              )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //add shadow to the submit button // submit button
            buildButtonHalfContainer(false),
            Positioned(
              top: 860,
              left: 168,
              child: Container(
                height: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                               Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginS(),
                            ),
                          );
                            },
                            child: Text("Login Instead",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                            ),),
                          )
                        ],
                      )
                    ],
                  ),
              ),
            ),
          ],
        ),
        );
  }
  Future registerUser() async {
    showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator( color: cAccentColor, ),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
        
      );
      createUser();

      setState(() {
        error = "";
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      setState(() {
        error = e.message.toString();
      });
    }
    Navigator.pop(context);
  }

  Future createUser() async {
    final user = FirebaseAuth.instance.currentUser;
    final userid = user!.uid;

    final docUser = FirebaseFirestore.instance.collection('Users').doc(userid);

    final newUser = Users(
      id: userid,
      nickname: nicknamecontroller.text,
      email: emailcontroller.text,
      password: passwordcontroller.text,
      age: agecontroller.text,
      image: 'https://firebasestorage.googleapis.com/v0/b/melon-d5a58.appspot.com/o/users%2Fimage-removebg-preview%20(28).png?alt=media&token=2bd374a0-d64b-48d9-926a-4a7c6b0567f9',
    );

    final json = newUser.toJson();
    await docUser.set(json);

    Navigator.pop(context);
  }

  Widget buildButtonHalfContainer(bool showShadow) {
    return Positioned(
        top: 635,
        right: 0,
        left: 0,
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NavBar(),
                ),
              );
            },
            child: GestureDetector(
              onTap: () {
                    if(emailcontroller.text=='' || nicknamecontroller.text=='' || passwordcontroller.text=='' || agecontroller.text == ''){

                    }
                    else{
                      registerUser();
                    }
              },
              child: Container(
                height: 90,
                width: 90,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      if (showShadow)
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            spreadRadius: 10,
                            blurRadius: 10,
                            offset: Offset(0, 5))
                    ]),
                child: !showShadow
                    ? Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.deepPurple, Colors.purpleAccent],
                                begin: Alignment.center,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.3),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 1))
                            ]),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      )
                    : Center(),
              ),
            ),
          ),
        ));
  }
  // void showsnackBar(
  //   String msg
  // ) => SnackBar(content: content)
}
