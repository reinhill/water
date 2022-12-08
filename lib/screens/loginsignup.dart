
import 'package:flutter/material.dart';
import 'package:water/components/bottomnavbar.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/users.dart';


class Login extends StatefulWidget {
  const Login({super.key, });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late TextEditingController emailcontroller;
  late TextEditingController passwordcontroller;
  late String error;

  bool isMale = true;
  bool isSignupScreen = true;
  bool isRememberMe = false;

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
                        isSignupScreen? "Start your Journey by Signing Up" : "Start your Journey by Logging in",
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 18,
                          color: cLightFontColor,
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
                top: isSignupScreen? 250 : 280,
                child: Container(
                  height: isSignupScreen? 450 : 260,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width -40,
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
                                setState(() {
                                  isSignupScreen = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: !isSignupScreen ? cAccentColor : cDarkGreyFontColor,
                                    ),
                                  ),
                                  if (!isSignupScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 60,
                                      color: cColor5,
                                    )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupScreen = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'SIGNUP',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      color: isSignupScreen? cDarkFontColor : cLightwFontColor,
                                    ),
                                  ),
                                  if (isSignupScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 60,
                                      color: cColor5,
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                        if(isSignupScreen) buildSignupSection(),
                        if(!isSignupScreen) buildSigninSection(),
                  
                      ],
                    ),
                  ),
                ),
                ),

                        //add shadow to the submit button // submit button
                        buildButtonHalfContainer(false)



                              ],
                            ));
                      }

                      Container buildSigninSection() {
                        return Container(
                                          margin: EdgeInsets.only(top: 20 ),
                                          child: Column(
                                            children: [
                                              buildLogInTextField(Icons.email_outlined, "Email", false, true),
                                            buildLogInTextField(Icons.lock_outline, "Password", true, false),
                                            ],

                                          ),
                                        );
                      }

                      Container buildSignupSection() {
                        return Container(
                      margin: EdgeInsets.only(top:30),
                      child: Column(
                        children:  [
                          buildsignUpTextField(Icons.face_outlined, "Nickname", false, false),
                          buildsignUpTextField(Icons.email_outlined, "Email", false, true),
                          buildsignUpTextField(Icons.lock_outline, "Password", true, false),
                          buildsignUpTextField(Icons.numbers, "Age", false, false),

                          
                          SizedBox(
                            height: 30,
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
                    );
  }

  Widget buildButtonHalfContainer(bool showShadow, ) {
    return Positioned(
            top: isSignupScreen? 650 : 490,
            right: 0,
            left: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  NavBar()
                      ),
                    );
                },
                child: Container(
                  height: 90,
                  width: 90, 
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      if(showShadow)
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(0,5)
                        )
                      ]
                  ),
                child: !showShadow ? Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purpleAccent, Colors.black],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0,1)
                        )
                      ]
                  ),
                  child: Icon(Icons.arrow_forward, 
                  color: Colors.white,),
              
                ) : Center(),
                        ),
              ),
            ));
  }

                Widget buildLogInTextField(
                  IconData icon, String labelText, bool isLoginPassword, bool isLoginEmail
                ) {
                      return Padding(
                        padding:  EdgeInsets.only(bottom: 10.0),
                        child: TextField(
                          obscureText: isLoginPassword,
                          keyboardType: isLoginEmail? TextInputType.emailAddress : TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  icon,
                                  color: cAccentColor,
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
                                labelText: labelText,
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                color: cAccentColor
                                 ),
                              ),
                            ),
                      );
  }
  Widget buildsignUpTextField(
                  IconData icon, String labelText, bool isPassword, bool isEmail
                ) {
                      return Padding(
                        padding:  EdgeInsets.only(bottom: 10.0),
                        child: TextField(
                          obscureText: isPassword,
                          keyboardType: isEmail? TextInputType.emailAddress : TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  icon,
                                  color: cAccentColor,
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
                                labelText: labelText,
                                labelStyle: TextStyle(
                                  fontSize: 15,
                                color: cAccentColor
                                 ),
                              ),
                            ),
                      );
  }
}
