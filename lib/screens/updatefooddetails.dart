import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/newrecipe.dart';
import 'package:water/components/newrecipepost.dart';
import 'package:water/screens/cookbook.dart';

class Updatefooddetails extends StatefulWidget {
  const Updatefooddetails({super.key, required this.newrecipePost});

  final NewRecipePost newrecipePost;

  @override
  State<Updatefooddetails> createState() => _UpdatefooddetailsState();
}

class _UpdatefooddetailsState extends State<Updatefooddetails> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  NewRecipeOld newRecipe = NewRecipeOld();

  final levelItems = ['Easy', 'Medium', 'Hard'];
  int index = 0;

  late TextEditingController newrecipeimgcontroller;
  late TextEditingController newrecipenamecontroller;
  late TextEditingController newrecipetimecontroller;
  late TextEditingController newrecipelevelcontroller;
  late TextEditingController newrecipeingredientscontroller;
  late TextEditingController newrecipeprocedurecontroller;
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
    final path = 'newRecipe/${pickedFile!.name}';
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

    updateNewRecipe(widget.newrecipePost.newrecipepost_id ,urlDownload);

    setState(() {
      uploadTask = null;
    });
  }

  @override
  void initState() {
    super.initState();

    newrecipeimgcontroller =
        TextEditingController(text: widget.newrecipePost.newrecipeimg);
    newrecipenamecontroller =
        TextEditingController(text: widget.newrecipePost.newrecipename);
    newrecipetimecontroller =
        TextEditingController(text: widget.newrecipePost.newrecipetime);
    newrecipelevelcontroller =
        TextEditingController(text: widget.newrecipePost.newrecipelevel);
    newrecipeingredientscontroller =
        TextEditingController(text: widget.newrecipePost.newrecipeingredients);
    newrecipeprocedurecontroller =
        TextEditingController(text: widget.newrecipePost.newrecipeprocedure);
    imgUrl = widget.newrecipePost.newrecipeimg;
    error = "";

    newRecipe.ingredients = List<String>.empty(growable: true);
    newRecipe.ingredients!.add("");
    newRecipe.procedure = List<String>.empty(growable: true);
    newRecipe.procedure!.add("");
  }

  @override
  void dispose() {
    newrecipeimgcontroller.dispose();
    newrecipenamecontroller.dispose();
    newrecipetimecontroller.dispose();
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
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Update Recipe ',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: cLightbackColor,
              letterSpacing: 1,
            ),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: ListView(key: globalKey, children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 400,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: cLightFontColor.withOpacity(0.5)),
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
                               
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 400,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: cAccentColor.withOpacity(0.5),
                              ),
                               child: Center(
                                  child: (pickedFile == null)
                                      ? checkImgVal()
                                      : imgExist(),
                                ),
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
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              right: 15,
              left: 15,
            ),
            child: Container(
              height: 240,
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
                          child: TextField(
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
                          child: TextField(
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
                (pickedFile != null)
                          ? uploadFile()
                          : updateNoFile(widget.newrecipePost.newrecipepost_id);
                          Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: cAccentColor,
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(30)),
              ),
              child: const Text(
                'Update Recipe',
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
       height: 380,
       width: 280,
        fit: BoxFit.cover,
      );

  Widget imgNotExist() => Image.network(
        widget.newrecipePost.newrecipeimg,
       height: 380,
       width: 280,
        fit: BoxFit.cover,
      );

  Widget imgNotExistBlank() => Image.asset(
        'assets/images/no-image.png',
        height: 380,
       width: 280,
        fit: BoxFit.cover,
      );

  Widget checkImgVal() {
    return (widget.newrecipePost.newrecipeimg == '-') ? imgNotExistBlank() : imgNotExist();
  }


  Future updateNewRecipe(String id, String image) async {
    final docUser = FirebaseFirestore.instance.collection('NewRecipe').doc(id);
    await docUser.update({
      'newrecipename': newrecipenamecontroller.text,
      'newrecipetime': newrecipetimecontroller.text,
      'newrecipelevel': newrecipelevelcontroller.text,
      'newrecipeingredients': newrecipeingredientscontroller.text,
      'newrecipeprocedure': newrecipeprocedurecontroller.text,
      'newrecipeimg': image,
    });

    Navigator.pop(context);
  }

  Future updateNoFile(String id) async {
    final docUser = FirebaseFirestore.instance.collection('NewRecipe').doc(id);
    await docUser.update({
      'newrecipename': newrecipenamecontroller.text,
      'newrecipetime': newrecipetimecontroller.text,
      'newrecipelevel': newrecipelevelcontroller.text,
      'newrecipeingredients': newrecipeingredientscontroller.text,
      'newrecipeprocedure': newrecipeprocedurecontroller.text,
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


}
