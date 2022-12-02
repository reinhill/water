import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/screens/profilescreen.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
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
               Navigator.of(context).pop(
                          MaterialPageRoute(
                            builder: (context) => Profile(),
                          ),
                        );
            },
          ),
          title: Text(
            'Update Profile',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: cLightbackColor,
              letterSpacing: 2,
            ),
          ),
          
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView(
          children: [Center(
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
                                  padding: const EdgeInsets.only(
                                      top: 15.0, right: 15.0, bottom: 15.0, left: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Catherine Cahilog",
                                        style: TextStyle(
                                            color: cLightbackColor,
                                            fontSize: 28,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      Text(
                                        "cath@gmail.com",
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
                      Container(
                        height: 480,
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: cLightFontColor
                        ),
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          
                           Padding(
                             padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                             child: Container(
                              height: 50,
                              width: 380,
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1,
                                  color: cAccentColor,
                                  style: BorderStyle.solid)),
                              child: TextField(
                               // controller: usernamecontroller,
                                onChanged: (content) {
                                  setState(() {
                                  //  emailcontroller.text = content;
                                  });
          
                                },
                                decoration:  InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline, 
                                  color:cAccentColor ),
                                  hintText: 'reinhill',
                                  labelStyle: TextStyle(
                                    color: cAccentColor
                                  ),
                                  contentPadding: EdgeInsets.all(15),
                                  border: InputBorder.none,
                                
                                ),
                              ),
                          ),
                           ),
                           const SizedBox(
                            height: 15,
                          ),
                           Padding(
                             padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                             child: Container(
                              height: 50,
                              width: 380,
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1,
                                  color: cAccentColor,
                                  style: BorderStyle.solid)),
                              child: TextField(
                                obscureText: true,
                               // controller: passwordcontroller,
                                decoration:  InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined, 
                                  color:cAccentColor ),
                                  hintText: 'cath@gmail.com',
                                  labelStyle: TextStyle(
                                    color: cAccentColor
                                  ),
                                  contentPadding: EdgeInsets.all(15),
                                  border: InputBorder.none,
                                
                                ),
                              ),
                          ),
                           ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Container(
                              width: 380,
                              height: 50,
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1,
                                  color: cAccentColor,
                                  style: BorderStyle.solid)),
                              child: TextField(
                                //controller: emailcontroller,
                                decoration:  InputDecoration(
                                  prefixIcon: Icon(Icons.fingerprint, 
                                  color:cAccentColor ),
                                  hintText: 'catherineeee',
                                  labelStyle: TextStyle(
                                    color: cAccentColor
                                  ),
                                  contentPadding: EdgeInsets.all(15),
                                  border: InputBorder.none,
                                
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                           Padding(
                             padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                             child: Container(
                              width: 380,
                              height: 50,
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1,
                                  color: cAccentColor,
                                  style: BorderStyle.solid)),
                              child: TextField(
                                //controller: namecontroller,
                                decoration:  InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline, 
                                  color:cAccentColor ),
                                  hintText: 'Catherine Cahilog',
                                  labelStyle: TextStyle(
                                    color: cAccentColor
                                  ),
                                  contentPadding: EdgeInsets.all(15),
                                  border: InputBorder.none,
                                
                                ),
                              ),
                          ),
                           ),
                           const SizedBox(
                            height: 15,
                          ),
                            Padding(
                             padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                             child: Container(
                              width: 380,
                              height: 50,
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1,
                                  color: cAccentColor,
                                  style: BorderStyle.solid)),
                              child: TextField(
                                //controller: namecontroller,
                                decoration:  InputDecoration(
                                  prefixIcon: Icon(Icons.numbers, 
                                  color:cAccentColor ),
                                  hintText: '20',
                                  labelStyle: TextStyle(
                                    color: cAccentColor
                                  ),
                                  contentPadding: EdgeInsets.all(15),
                                  border: InputBorder.none,
                                
                                ),
                              ),
                          ),
                           ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: ElevatedButton(
                              onPressed: () {
                               // registerUser();
                              },
                              style: ElevatedButton.styleFrom(
                                 backgroundColor: cAccentColor,
                                 shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(30)),
                                minimumSize: const Size.fromHeight(50),
                              ),
                              child: const Text(
                                'Update Profile',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Container(
                          //   padding: const EdgeInsets.all(20),
                          //   child: Text(
                          //    // error,
                          //     style: TextStyle(
                          //       color: Colors.red,
                          //     ),
                          //   ),
                          // ),
                        ],
                    ),
                      ),
          
          
                      
                    ],
                  ),
                ),
              ],
            ),
          ),]
        ));
  }

  }

