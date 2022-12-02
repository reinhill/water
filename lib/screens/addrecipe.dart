


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/components/newrecipe.dart';
import 'package:water/screens/cookbook.dart';

class AddRecipe extends StatefulWidget {
  const AddRecipe({super.key});

  @override
  State<AddRecipe> createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  NewRecipe newRecipe = NewRecipe();

  late TextEditingController levelcontroller;

  final levelItems = ['Easy', 'Medium', 'Hard'];
  int index = 0; 

  @override
  void initState() {
    super.initState();
     levelcontroller = TextEditingController();
     newRecipe.ingredients = List<String>.empty(growable: true);
     newRecipe.ingredients!.add("");
     newRecipe.procedure = List<String>.empty(growable: true);
     newRecipe.procedure!.add("");
  }
   @override
  void dispose() {
    levelcontroller.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor,
      appBar: AppBar(
        backgroundColor: cLightGreyColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded,
          color: cLightbackColor,), 
          onPressed: (){
            Navigator.of(context).pop(
                          MaterialPageRoute(
                            builder: (context) => CookBook(),
                          ),
                        );
          },),
        title: Text('Create Recipe ',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: cLightbackColor,
          letterSpacing: 1,
        ),),
        
        elevation: 0,
        centerTitle: true,
      ),
        body: ListView(

          key: globalKey,
          children: [
            Center(
            child: Column(
              children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 400,
                        width: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: cAccentColor.withOpacity(0.5)
                        ),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(15.0),
                                  margin: EdgeInsets.only(top: 120, right: 0.0),
                                  decoration: BoxDecoration(
                                    color: cLightGreyColor,
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Icon(Icons.upload_outlined, size: 40, 
                                  color: Colors.white,)),
                                ),
                              ],
                            ),
                             Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                  },
                                  child: Container(
                                    height: 40.0,
                                    width: 140,
                                      padding: EdgeInsets.all(10.0),
                                  margin: EdgeInsets.only(top: 220, right: 150.0, left: 20.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: cAccentColor
                                    ),
                                    child: Text("from Camera",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0
                                    ),
                                    textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                
                              ],
                             ),
                             Column(
                              children: [
                                GestureDetector(
                                  
                                  onTap: () {
                                  },
                                  child: Container(
                                    height: 40.0,
                                    width: 140,
                                      padding: EdgeInsets.all(10.0),
                                  margin: EdgeInsets.only(top: 220, right: 20.0, left: 150.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: cAccentColor
                                    ),
                                    child: Text("from Gallery",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0
                                    ),
                                    textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                
                              ],
                             )
                          ],
                        ),
                      ),
                    )
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 15, left: 15, ),
            child: Container(
              height: 240,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.purple.withOpacity(0.15)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:20.0, right:20.0,),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        
                        child: TextFormField(
                          decoration: const InputDecoration(
                            
                             enabledBorder: UnderlineInputBorder(      
                            borderSide: BorderSide(color: cAccentColor),   
                            ),  
                    focusedBorder: UnderlineInputBorder(
                      
                            borderSide: BorderSide(color: cAccentColor),
                         ),
                            labelText: 'Name:',
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: cAccentColor
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: TextFormField(
                          decoration: const InputDecoration(
                             enabledBorder: UnderlineInputBorder(      
                            borderSide: BorderSide(color: cAccentColor),   
                            ),  
                    focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: cAccentColor),
                         ),
                            labelText: 'Total time to prepare (minutes):',
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: cAccentColor
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: 
                        TextFormField(
                          
                          onTap: () {
                            showCupertinoModalPopup(context: context,
                         builder: (context) => CupertinoActionSheet(
                          actions: [buildpicker(levelcontroller, levelItems)],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: (){
                              Navigator.pop(context);
                          },
                           child: const Text('Done',
                           style: TextStyle(
                            color: cAccentColor
                           ),)),
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
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: cAccentColor
                            )
                          ),
                          controller: levelcontroller,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            
            padding: const EdgeInsets.only(top: 15.0, right: 15, left: 15, ),
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.purple.withOpacity(0.15)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:20.0, right:20.0,),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _ingredientsContainer(),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [ingredientsList(index) ],
                        );
                        
                      }, 
                      separatorBuilder: (context, index) => Divider(),
                       itemCount: newRecipe.ingredients!.length)
                     
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 15, left: 15, ),
            child: Container(
              height: 330,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.purple.withOpacity(0.15)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:20.0, right:20.0,),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _procedureContainer(),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [procedureList(index) ],
                        );
                        
                      }, 
                      separatorBuilder: (context, index) => Divider(),
                       itemCount: newRecipe.procedure!.length)
                     
                  ],
                ),
              ),
            ),
          ),
                      Container(
                        height: 100,
                            padding: const EdgeInsets.all(20),
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => Login(),
                                //   ),
                                // );
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
          
          
          ]
        )


    );

  }
  Widget _procedureContainer(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 30.0, bottom: 0.0),
          child: Text("Procedure(s)", textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: cAccentColor
          ),),
        ),
      ],
    );
  }

  Widget _ingredientsContainer(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 30.0, bottom: 0.0),
          child: Text("Ingredient(s)", textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: cAccentColor
          ),),
        ),
      ],
    );
  }

  Widget ingredientsList(index){
    return Padding(padding: EdgeInsets.all(2),
    child: Row(
      children: [
        Flexible
        
        (child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        
                        child: TextFormField(
                          decoration: const InputDecoration(
                            
                             enabledBorder: UnderlineInputBorder(      
                            borderSide: BorderSide(color: cAccentColor),   
                            ),  
                    focusedBorder: UnderlineInputBorder(
                      
                            borderSide: BorderSide(color: cAccentColor),
                         ),
                            labelText: '',
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: cAccentColor
                            )
                          ),
                        ),
                      ),),
                      Visibility(
                        child: SizedBox(
                        width:35,
                        child: IconButton(
                          icon: Icon(Icons.add_circle,
                          color: Colors.green,),
                          onPressed: (() {
                            addIngredientControl();
                          }),
                          ),

                      ),
                      visible: index == newRecipe.ingredients!.length - 1,
                      ),
                      
                       Visibility (
                         child: SizedBox(
                          width:35,
                          child: IconButton(
                            icon: Icon(Icons.remove_circle,
                            color: Colors.red,),
                            onPressed: (() {
                              removeIngredientControl(index);
                            }),
                            ),   ),
                            visible: index > 0,
                       ),
      ],
    ),);
  }
  Widget procedureList(index){
    return Padding(padding: EdgeInsets.all(2),
    child: Row(
      children: [
        Flexible
        
        (child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        
                        child: TextFormField(
                          decoration: const InputDecoration(
                            
                             enabledBorder: UnderlineInputBorder(      
                            borderSide: BorderSide(color: cAccentColor),   
                            ),  
                    focusedBorder: UnderlineInputBorder(
                      
                            borderSide: BorderSide(color: cAccentColor),
                         ),
                            labelText: '',
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                              color: cAccentColor
                            )
                          ),
                        ),
                      ),),
                      Visibility(
                        child: SizedBox(
                        width:35,
                        child: IconButton(
                          icon: Icon(Icons.add_circle,
                          color: Colors.green,),
                          onPressed: (() {
                            addProcedureControl();
                          }),
                          ),

                      ),
                      visible: index == newRecipe.procedure!.length - 1,
                      ),
                      
                       Visibility (
                         child: SizedBox(
                          width:35,
                          child: IconButton(
                            icon: Icon(Icons.remove_circle,
                            color: Colors.red,),
                            onPressed: (() {
                              removeProcedureControl(index);
                            }),
                            ),   ),
                            visible: index > 0,
                       ),
      ],
    ),);
  }
  


  Widget buildpicker(controller, listitems) => SizedBox(
    height: 200,
    child: CupertinoPicker(scrollController: FixedExtentScrollController(
    ),
    looping: false,
    itemExtent: 65,
    onSelectedItemChanged: (index){
      setState(() {
        final item = listitems[index];
        controller.text = item;
      });
    },
    children: List.generate(listitems.length, (index) {
      final item = listitems[index];
      return Center(child: Text(
        item,
        style: const TextStyle(
          fontSize: 25
          ),
      ),
      );
    }),
    ),
  );

  void addIngredientControl() {
    setState(() {
      newRecipe.ingredients!.add("");
    });
  }
  void removeIngredientControl(index) {
    setState(() {
     if(newRecipe.ingredients!.length > 1){
      newRecipe.ingredients!.removeAt(index); 
     }
    });
  }
  void addProcedureControl() {
    setState(() {
      newRecipe.procedure!.add("");
    });
  }
  void removeProcedureControl(index) {
    setState(() {
     if(newRecipe.procedure!.length > 1){
      newRecipe.procedure!.removeAt(index); 
     }
    });
  }
}