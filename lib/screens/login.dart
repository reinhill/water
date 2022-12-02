import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:water/components/bottomnavbar.dart';
import 'package:water/components/constnt.dart';
import 'package:water/screens/signup.dart';

class LoginS extends StatefulWidget {
  const LoginS({super.key});

  @override
  State<LoginS> createState() => _LoginSState();
}

class _LoginSState extends State<LoginS> {
  late TextEditingController emailcontroller;
  late TextEditingController passwordcontroller;
  late String error;

 

  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    error = "";
   
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
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
                        "Start your Journey by Logging In ",
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
            Positioned(
              top: 240,
              child: Container(
                height: 350,
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
                            onTap: () {},
                            child: Column(
                              children: [
                                Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: cAccentColor,
                                      letterSpacing: 2),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
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
                        padding:
                            EdgeInsets.only(top: 15.0, right: 10.0, left: 10.0),
                        child: TextField(
                           controller: passwordcontroller,
                           obscureText: true,
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
                    ],
                  ),
                ),
              ),
            ),
            //add shadow to the submit button // submit button
            buildButtonHalfContainer(false),

            Positioned(
              top: 860,
              left: 130,
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
                                builder: (context) => SignUpS(),
                              ),
                            );
                          },
                          child: Text(
                            "New Here? Sign up now!",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
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

  Widget buildButtonHalfContainer(bool showShadow) {
    return Positioned(
        top: 540,
        right: 0,
        left: 0,
        child: Center(
          child: GestureDetector(
            onTap: () {
              signIn();
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
        ));
  }


  Future signIn() async {
    showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
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
}
