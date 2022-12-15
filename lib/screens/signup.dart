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
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nicknamecontroller;
  late TextEditingController emailcontroller;
  late TextEditingController passwordcontroller;
  late TextEditingController agecontroller;

  late String error;
  bool _obscureText = true;
  bool _isobscureText = true;
  bool visible = false; 



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
                top: 125.0,
                left: 315.0,
                child: Image.asset("assets/images/coriander.png",
                    height: 120, fit: BoxFit.contain),
              ),
              Positioned(
                top: 715.0,
                right: 308.0,
                child: Image.asset("assets/images/coriander.png",
                    height: 120, fit: BoxFit.contain),
              ),
                  Positioned(
                  top: 180,
                  child: Container(
                    height: 600,
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
                      child: SafeArea(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: 
                                      [Column(
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
                                    ],
                                 
                                
                              ),
                              
                              Padding(
                                padding: EdgeInsets.only(top: 25.0, right: 10.0, left: 10.0),
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: validateNickname,
                                  controller: nicknamecontroller,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      fontSize: 13, color: Colors.red
                                    ),
                                    errorBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
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
                                  child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: validateEmail,
                                    controller: emailcontroller,
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                      fontSize: 13, color: Colors.red
                                    ),
                                    errorBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
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
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: validatePassword,
                                  obscureText: _obscureText,
                                  controller: passwordcontroller,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      fontSize: 13, color: Colors.red
                                    ),
                                    errorBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.fingerprint_outlined,
                                      color: cAccentColor,
                                      size: 30,
                                    ),
                                    suffixIcon: IconButton(onPressed: (){ 
                                    setState(() {
                                      _isobscureText = !_isobscureText;
                                      _obscureText = !_obscureText;
                                    });
                                   }, icon: Icon(_isobscureText? Icons.visibility_off : Icons.visibility),
                                   color: cAccentColor),
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
                                child: TextFormField(
                                   autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: validateAge,
                                  controller: agecontroller,
                                  decoration: InputDecoration(
                                     errorStyle: TextStyle(
                                      fontSize: 13, color: Colors.red
                                    ),
                                    errorBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(35.0),
                                      ),
                                    ),
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
                              
                                  Container(
                                    width: 250,
                                    margin: EdgeInsets.only(top: 75),
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
         final snackbar = SnackBar(
                   duration: Duration(seconds: 3),
                   margin: const EdgeInsets.only(bottom: 80),
                   behavior: SnackBarBehavior.floating,
                   backgroundColor: Colors.transparent,
                   elevation: 0,
                   content: Container(
                     height: 60,
                    width: 40,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green[300]
                    ),
                     child: Row (
                      children: [
                        SizedBox(height: 10),
                      Expanded (
                        child: Text ('Register successfully',style: TextStyle(color: Colors.white,fontSize: 15)),
                      ),
                      SizedBox(width:5),

                      Icon(Icons.verified,
                      color: Colors.white,
                      ),
                      ]
                      ),
                    
                   )
                    
                   );
                   ScaffoldMessenger.of(context).showSnackBar(snackbar);
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      setState(() {
        error = e.message.toString();
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
                      color: Colors.red[400]
                    ),
                     child: Row (
                      children: [
                          SizedBox(height: 10),
                      Expanded (
                        child: Text ('Failed to sign up',style: TextStyle(color: Colors.white,fontSize: 15)),
                      ),
                      SizedBox(width:5),

                      Icon(Icons.verified,
                      color: Colors.white,
                      ),
                      ]
                      ),
                    
                   )
                    
                   );
                   ScaffoldMessenger.of(context).showSnackBar(snackbar);
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
        top: 730,
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
                    {
                  if (_formKey.currentState!.validate()) {
                    registerUser();
                  }
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
   String? validateEmail(String? value) {
  String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'Please enter valid email';
    else
      return null;
  }
  String? validateNickname(String? value) {
   if (value!.isEmpty){
    return 'Please enter nickname';
    }
    if (value.length < 4) {
      return "nickname must be more than 2 charater";
    }
      
    else
      return null;
  }
 String? validatePassword(String? value) {
    if (value!.isEmpty){
    return 'Please enter password';
    }
    if (value.length < 6) {
      return "password should be at least 6 characters";
    }
      
    else
      return null;
  }
  String? validateAge(String? value) {
    if (value!.isEmpty)
      return 'Please enter age';
    else
      return null;
  }
}
