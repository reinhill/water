import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:water/components/bottomnavbar.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/users.dart';
import 'package:water/screens/signup.dart';

class LoginS extends StatefulWidget {
  const LoginS({super.key, });


  @override
  State<LoginS> createState() => _LoginSState();
}

class _LoginSState extends State<LoginS> {
  final _formKey1 = GlobalKey<FormState>();
  late TextEditingController emailcontroller;
  late TextEditingController passwordcontroller;
  late String error; 
  bool _obscureText = true;
  bool _isobscureText = true;
  bool visible = false; 
  
  
  

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
                    ),
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
            children: [
              Positioned(
                top: 178.0,
                left: 315.0,
                child: Image.asset("assets/images/coriander.png",
                    height: 120, fit: BoxFit.contain),
              ),
              Positioned(
                top: 600.0,
                right: 310.0,
                child: Image.asset("assets/images/coriander.png",
                    height: 120, fit: BoxFit.contain),
              ),
              Positioned(
                top: 240,
                child: Container(
                  height: 420,
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
                          key: _formKey1,
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
                                    labelStyle: TextStyle(
                                        fontSize: 17, color: cAccentColor),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 15.0, right: 10.0, left: 10.0),
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: validatePassword,
                                controller: passwordcontroller,
                                obscureText: _obscureText,
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
                            SizedBox(
                              height: 28,
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
                  ),
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
        top: 600,
        right: 0,
        left: 0,
        child: Center(
          child: GestureDetector(
            onTap: () {
          if (_formKey1.currentState!.validate()) {
           signIn();
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
        ));
  }

  Future signIn() async {
    showDialog(
      context: context,
      useRootNavigator: false,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator( color: cAccentColor, ),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim(),
      );
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
                        child: Text ('Login successfully',style: TextStyle(color: Colors.white,fontSize: 15)),
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
                        child: Text ('Failed to login',style: TextStyle(color: Colors.white,fontSize: 15)),
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
   String? validateEmail(String? value) {
  String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'Please enter valid email';
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
}
