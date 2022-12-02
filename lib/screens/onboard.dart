import 'package:flutter/material.dart';
import 'package:water/components/constnt.dart';
import 'package:water/screens/login.dart';
import 'package:water/screens/loginsignup.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  top: 450.0,
                  right: 25.0,
                  child: Image.asset("assets/images/coriander.png",
                      height: 85, fit: BoxFit.contain),
                ),
                Positioned(
                  top: 450.0,
                  right: 80.0,
                  child: Image.asset("assets/images/coriander.png",
                      height: 85, fit: BoxFit.contain),
                ),
                Positioned(
                  top: 450.0,
                  left: 70.0,
                  child: Image.asset("assets/images/coriander.png",
                      height: 85, fit: BoxFit.contain),
                ),
                Positioned(
                  top: 450.0,
                  left: 15.0,
                  child: Image.asset("assets/images/coriander.png",
                      height: 85, fit: BoxFit.contain),
                ),
              Container(
                height: 500,
                padding: EdgeInsets.only(top: 120),
                child: Positioned(
                  child: Image.asset(
                    "assets/images/women5.png",
                    height: 450.0,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 300.0,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 32, right: 32.0, bottom: 100.0, ),
            padding: EdgeInsets.symmetric(vertical: 38.0),
            decoration: BoxDecoration(
              color: cLightGreyColor,
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                BoxShadow(offset: Offset(5, 15), blurRadius: 20.0),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Enjoy Cooking',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35.0,
                    color: cLightFontColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Text(
                  'Delicious and detailed \n food recipes on your phone',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: cLightbackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                FloatingActionButton.extended(
                  extendedPadding: EdgeInsets.all(60),
                  label: const Text(
                    "Get Started",
                    style: TextStyle(fontSize: 20,
                     ),
                  ), // <-- Text
                  backgroundColor: cAccentColor,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginS(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
