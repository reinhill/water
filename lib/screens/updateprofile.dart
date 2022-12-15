import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/users.dart';
import 'package:water/screens/profilescreen.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key, required this.user,
  });

  final Users user;

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  late TextEditingController nicknamecontroller;
  late TextEditingController emailcontroller;
  late TextEditingController passwordcontroller;
  late TextEditingController agecontroller;
  late String imgUrl;
  late String error;
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'users/${pickedFile!.name}';
    print('update path Link: $path');
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);

    try {
      setState(() {
        uploadTask = ref.putFile(file);
      });
    } on FirebaseException catch (e) {
      setState(() {
        error = e.message.toString();
      });
    }

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('update Download Link: $urlDownload');

    updateUser(widget.user.id, urlDownload);

    setState(() {
      uploadTask = null;
    });
  }
  @override
  void initState() {
    super.initState();
    nicknamecontroller = TextEditingController(
      text: widget.user.nickname
    );
    emailcontroller = TextEditingController(
      text: widget.user.email
    );
    passwordcontroller = TextEditingController(
      text: widget.user.password
    );
    agecontroller = TextEditingController(
      text: widget.user.age
    );

    imgUrl = widget.user.image;
    error = "";
  }

  @override
  void dispose() {
    nicknamecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    agecontroller.dispose();
    super.dispose();
    
  }


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
                          height: 180,
                          decoration: BoxDecoration(
                              color: cLightGreyColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(150.0),
                                  bottomRight: Radius.circular(0.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                     selectFile();
                                  },
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: 
                                      [
                                        Container(
                                        height: 300,
                                        child: Center(
                                      child: (pickedFile == null) ? checkImgVal() : imgExist(),
                                    ),
                                      ),
                                      (pickedFile == null) ? Positioned(
                                    top: 120,
                                    left: 125,
                                    child:
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                        
                                          color: cAccentColor
                                        ),
                                        child: Icon(Icons.photo_size_select_actual_rounded, color: Colors.white, size: 20,),
                                      )
                                    
                                  ): Positioned(
                                    top: 120,
                                    left: 140,
                                    child:
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                        
                                          color: cAccentColor
                                        ),
                                        child: Icon(Icons.photo_size_select_actual_rounded, color: Colors.white, size: 20,),
                                      ),
                                    
                                  )
                                
                                
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
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
                        height: 420,
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
                                controller: nicknamecontroller,
                                onChanged: (content) {
                                  setState(() {
                                  //  emailcontroller.text = content;
                                  });
          
                                },
                                decoration:  InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline, 
                                  color:cAccentColor ),
                                  
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
                                controller: emailcontroller,
                                decoration:  InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined, 
                                  color:cAccentColor ),
                                  
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
                                controller: passwordcontroller,
                                decoration:  InputDecoration(
                                  prefixIcon: Icon(Icons.fingerprint, 
                                  color:cAccentColor ),
                                   
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
                                controller: agecontroller,
                                decoration:  InputDecoration(
                                  prefixIcon: Icon(Icons.numbers, 
                                  color:cAccentColor ),
                                  
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
                                 if(emailcontroller.text=='' || nicknamecontroller.text=='' || passwordcontroller.text=='' || agecontroller.text == ''){
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
                      color: Colors.red[300]
                    ),
                     child: Row (
                      children: [
                        SizedBox(width: 10),
                      Expanded (
                        child: Text ('Please Check Empty Fields',style: TextStyle(color: Colors.white,fontSize: 15)),
                      ),
                      SizedBox(width:5),

                      Icon(Icons.cancel,
                      color: Colors.white,
                      ),
                       SizedBox(width: 10),
                      ]
                      ),
                    
                   )
                    
                   );
                   ScaffoldMessenger.of(context).showSnackBar(snackbar);

                    }
                    else{
                        (pickedFile != null)
                                ? uploadFile()
                                : updateNoFile(widget.user.id); 
                    }
                                  
                                  
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
  
  Widget imgExist() => CircleAvatar(
    maxRadius: 80.0,
      minRadius: 80.0,
    child: Image.file(
          File(pickedFile!.path!),
          width: 250,
          height: 250,
          fit: BoxFit.cover,
        ),
  );

  Widget imgNotExist() => CircleAvatar(
      maxRadius: 80.0,
      minRadius: 80.0,
    child: Image.network(
          widget.user.image,
          width: 250,
          height: 250,
          fit: BoxFit.cover,
          
  
          errorBuilder: (context, error, stackTrace) {
                return CircleAvatar(
                  maxRadius: 80.0,
                  minRadius: 80.0,
                  child: Image.network(widget.user.image,
                       fit: BoxFit.cover, 
                       width: 250,
                          height: 250,),
                );
              },
  
          
        ),
  );

  Widget imgNotExistBlank() => CircleAvatar(
    maxRadius: 80.0,
    minRadius: 80.0,
    child: Image.network(
          widget.user.image,
          width: 250,
          height: 250,
          fit: BoxFit.cover,
        ),
  );

  Widget checkImgVal() {
    return (widget.user.image == widget.user.image) ? imgNotExistBlank() : imgNotExist();
  }
  
 Future updateUser(String id, String image) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc(id);
    await docUser.update({
      "password": passwordcontroller.text,
      "email": emailcontroller.text,
      "name": nicknamecontroller.text,
      "age": agecontroller.text,  
      'image': image,
    });
    final snackbar = SnackBar(
                   duration: Duration(seconds: 3),
                   margin: const EdgeInsets.only(bottom: 65),
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
                        SizedBox(width: 10),
                      Expanded (
                        child: Text ('Profile Updated successfully',style: TextStyle(color: Colors.white,fontSize: 15)),
                      ),
                      SizedBox(width:5),

                      Icon(Icons.verified,
                      color: Colors.white,
                      ),
                       SizedBox(width: 10),
                      ]
                      ),
                    
                   )
                    
                   );
                   ScaffoldMessenger.of(context).showSnackBar(snackbar);
    Navigator.pop(context);

  }

  Future updateNoFile(String id) async {
    final docUser = FirebaseFirestore.instance.collection('Users').doc(id);
    await docUser.update({
     "password": passwordcontroller.text,
     "email": emailcontroller.text,
     "name": nicknamecontroller.text,
     "age": agecontroller.text,  
      
    });
    final snackbar = SnackBar(
                   duration: Duration(seconds: 3),
                   margin: const EdgeInsets.only(bottom: 65),
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
                        SizedBox(width: 10),
                      Expanded (
                        child: Text ('Profile Updated successfully',style: TextStyle(color: Colors.white,fontSize: 15)),
                      ),
                      SizedBox(width:5),

                      Icon(Icons.verified,
                      color: Colors.white,
                      ),
                       SizedBox(width: 10),
                      ]
                      ),
                    
                   )
                    
                   );
                   ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  Navigator.pop(context);

  }





  }

