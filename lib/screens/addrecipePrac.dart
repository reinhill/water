import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/newrecipe.dart';
import 'package:water/components/newrecipepost.dart';
import 'package:water/screens/cookbook.dart';

class AddRecipePrac extends StatefulWidget {
  const AddRecipePrac({super.key});

  @override
  State<AddRecipePrac> createState() => _AddRecipePracState();
}

class _AddRecipePracState extends State<AddRecipePrac> {
  final users = FirebaseAuth.instance.currentUser!;
  final _formKey2 = GlobalKey<FormState>();
  NewRecipeOld newRecipe = NewRecipeOld();
  

  final levelItems = ['Easy', 'Medium', 'Hard'];
  int index = 0;

  late TextEditingController newrecipeimgcontroller;
  late TextEditingController newrecipenamecontroller;
  late TextEditingController newrecipetimecontroller;
  late TextEditingController newrecipelevelcontroller;
  late TextEditingController rateController;
  late TextEditingController newrecipeingredientscontroller;
  late TextEditingController newrecipeprocedurecontroller;
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
    final path = 'newRecipe/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);

    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link: $urlDownload');

    createRecipe(urlDownload);
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
                      color: cAccentColor
                    ),
                     child: Row (
                      children: [
                        SizedBox(width: 10),
                      Expanded (
                        child: Text ('Created Recipe Successfully',style: TextStyle(color: Colors.white,fontSize: 15)),
                      ),
                      SizedBox(width:5),

                      Icon(Icons.celebration,
                      color: Colors.white,
                      ),
                       SizedBox(width: 10),
                      ]
                      ),
                    
                   )
                    
                   );
                   ScaffoldMessenger.of(context).showSnackBar(snackbar);
  
    setState(() {
      uploadTask = null;
    });
     
  }

  @override
  void initState() {
    super.initState();

    newrecipeimgcontroller = TextEditingController();
    newrecipenamecontroller = TextEditingController();
    newrecipetimecontroller = TextEditingController();
    rateController = TextEditingController();
    newrecipelevelcontroller = TextEditingController();
    newrecipeingredientscontroller = TextEditingController();
    newrecipeprocedurecontroller = TextEditingController();
  }

  @override
  void dispose() {
    newrecipeimgcontroller.dispose();
    newrecipenamecontroller.dispose();
    newrecipetimecontroller.dispose();
    rateController.dispose();
    newrecipelevelcontroller.dispose();
    newrecipeingredientscontroller.dispose();
    newrecipeprocedurecontroller.dispose();

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
                  builder: (context) => CookBook(),
                ),
              );
            },
          ),
          title: Text(
            'Create Recipe ',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: cLightbackColor,
              letterSpacing: 1,
            ),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView(
          key: _formKey2,
           children: [
          SafeArea(
             
            child: Form(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 400,
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: cAccentColor.withOpacity(0.5)),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    selectFile();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Center(
                                      child: (pickedFile == null)
                                          ? imgNotExist()
                                          : imgExist(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    selectFile();
                                  },
                                  child: (pickedFile == null)
                                      ? Container(
                                          height: 40.0,
                                          width: 140,
                                          padding: EdgeInsets.all(10.0),
                                          margin: EdgeInsets.only(
                                              top: 230, right: 20.0, left: 80.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              color: cAccentColor),
                                          child: Text(
                                            "Upload",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      : Center(),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 370,
                              left: 270,
                              child: GestureDetector(
                                onTap: () {
                                  selectFile();
                                },
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                      color: cAccentColor,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              right: 15,
              left: 15,
            ),
            child: Container(
              height: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.purple.withOpacity(0.15)),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validaterecipename,
                        controller: newrecipenamecontroller,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cAccentColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cAccentColor),
                            ),
                            labelText: 'Name:',
                            labelStyle:
                                TextStyle(fontSize: 20.0, color: cAccentColor)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: TextFormField(
                        validator: validaterecipetime,
                        controller: newrecipetimecontroller,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cAccentColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cAccentColor),
                            ),
                            labelText: 'Total time to prepare (minutes):',
                            labelStyle:
                                TextStyle(fontSize: 20.0, color: cAccentColor)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: TextFormField(
                         validator: validaterecipelevel,
                        readOnly: true,
                        onTap: () {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (context) => CupertinoActionSheet(
                                    actions: [
                                      buildpicker(
                                          newrecipelevelcontroller, levelItems)
                                    ],
                                    cancelButton: CupertinoActionSheetAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Done',
                                          style: TextStyle(color: cAccentColor),
                                        )),
                                  ));
                        },
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cAccentColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cAccentColor),
                            ),
                            labelText: 'Level:',
                            labelStyle:
                                TextStyle(fontSize: 20.0, color: cAccentColor)),
                        controller: newrecipelevelcontroller,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 5),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],  
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                       validator:validatereciperate,
                        controller: rateController,
                        decoration: const InputDecoration(
                           
                                    
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cAccentColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: cAccentColor),
                            ),
                            
                            labelText: 'Rate (1-5):',
                            labelStyle:
                                TextStyle(fontSize: 20.0, color: cAccentColor)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              right: 15,
              left: 15,
            ),
            child: Container(
              height: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.purple.withOpacity(0.15)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child:
                            Row(
                              children: [
                                Positioned(
                                  top: -12.0,
                                  left: -5.0,
                                  child: Image.asset(
                                      "assets/images/coriander.png",
                                      height: 65,
                                      fit: BoxFit.contain),
                                ),
                                Text(
                                  "Ingredients",
                                  style: TextStyle(
                                      color: cAccentColor, fontSize: 25),
                                )
                              ],
                            )
                          
                        
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5.0),
                        child: Container(
                          width: 350,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.purple,
                                  style: BorderStyle.solid)),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: validaterecipeingredients,
                            controller: newrecipeingredientscontroller,
                            minLines: 10,
                            maxLines: 20,
                            decoration: const InputDecoration(
                                hintText: 'List of Ingredients',
                                contentPadding: EdgeInsets.all(15),
                                border: InputBorder.none),
                            onChanged: (value) {},
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              right: 15,
              left: 15,
            ),
            child: Container(
              height: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.purple.withOpacity(0.15)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: 
                            Row(
                              children: [
                                Positioned(
                                  top: -12.0,
                                  left: -5.0,
                                  child: Image.asset(
                                      "assets/images/coriander.png",
                                      height: 65,
                                      fit: BoxFit.contain),
                                ),
                                Text(
                                  "Procedure",
                                  style: TextStyle(
                                      color: cAccentColor, fontSize: 25),
                                )
                              ],
                            )
                          
                        
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5.0),
                        child: Container(
                          width: 350,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.purple,
                                  style: BorderStyle.solid)),
                          child: TextFormField(
                             autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: validaterecipeingredients,
                            controller: newrecipeprocedurecontroller,
                            minLines: 10,
                            maxLines: 20,
                            decoration: const InputDecoration(
                               
                                   
                                hintText: 'List of Procedure',
                                contentPadding: EdgeInsets.all(15),
                                border: InputBorder.none),
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
       
                 if(newrecipenamecontroller.text=='' || newrecipetimecontroller.text=='' || newrecipelevelcontroller.text=='' || newrecipeingredientscontroller.text == ''|| newrecipeprocedurecontroller.text=='' || pickedFile== null ){
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
                      uploadFile();
                    }
                
           
               
                print(newRecipe.toJson());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: cAccentColor,
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                'Save Recipe',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]));
  }

  Widget imgExist() => Image.file(
        File(pickedFile!.path!),
        height: 400,
        width: 280,
        fit: BoxFit.fill,
      );

  Widget imgNotExist() => Icon(Icons.upload_file);

  Future createRecipe(urlDownload) async {
    final docUser = FirebaseFirestore.instance
    .collection('NewRecipe')
    .doc(users.uid)
    .collection('userNewRecipePost')
    .doc();
    

    final newRecipe = NewRecipePost(
      newrecipepost_id: docUser.id,
      userId: users.uid,
      newrecipename: newrecipenamecontroller.text,
      newrecipetime: newrecipetimecontroller.text,
      newrecipelevel: newrecipelevelcontroller.text,
      rate: int.parse(rateController.text),
      newrecipeingredients: newrecipeingredientscontroller.text,
      newrecipeprocedure: newrecipeprocedurecontroller.text,
      newrecipeimg: urlDownload,
      isLiked: false,
    );

    final json = newRecipe.toJson();
    await docUser.set(json);
    
    setState(() {
      newrecipenamecontroller.text = "";
      newrecipetimecontroller.text = "";
      newrecipelevelcontroller.text = "";
      rateController.text = "";
      newrecipeingredientscontroller.text = "";
      newrecipeprocedurecontroller.text = "";
      newrecipelevelcontroller.text = "";
      pickedFile = null;
    });
    
    Navigator.pop(context);
    
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;

          return SizedBox(
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey,
                  color: Colors.green,
                ),
                Center(
                  child: Text(
                    '${(100 * progress).roundToDouble()}%',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox(
            height: 50,
          );
        }
      });

 
  

  Widget buildpicker(controller, listitems) => SizedBox(
        height: 200,
        child: CupertinoPicker(
          scrollController: FixedExtentScrollController(),
          looping: false,
          itemExtent: 65,
          onSelectedItemChanged: (index) {
            setState(() {
              final item = listitems[index];
              controller.text = item;
            });
          },
          children: List.generate(listitems.length, (index) {
            final item = listitems[index];
            return Center(
              child: Text(
                item,
                style: const TextStyle(fontSize: 25),
              ),
            );
          }),
        ),
      );
       String? validaterecipename(String? value) {
    if (value!.isEmpty)
      return 'This feild is required';
    else
      return null;
  }
   String? validaterecipetime(String? value) {
    if (value!.isEmpty)
      return 'This feild is required';
    else
      return null;
  }
  String? validatereciperate(String? value) {
    if (value!.isEmpty)
      return 'This feild is required';
    else
      return null;
  }
  String? validaterecipelevel(String? value) {
    if (value!.isEmpty)
      return 'This feild is required';
    else
      return null;
  }
   String? validaterecipeingredients(String? value) {
    if (value!.isEmpty)
      return 'This feild is required';
    else
      return null;
  }
  String? validaterecipeprocedure(String? value) {
    if (value!.isEmpty)
      return 'This feild is required';
    else
      return null;
  }
}
