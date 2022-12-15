import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:water/components/bottomnavbar.dart';
import 'package:water/components/constnt.dart';
import 'package:water/firebase_options.dart';
import 'package:water/screens/login.dart';
import 'package:water/screens/onboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return 
      MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'CookBook',
        theme: ThemeData(
          primaryColor: cPrimaryColor, 
          fontFamily: "Lato"
          ),
        home:  SplashScreen()
      );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 7)).then((value) {
      Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (ctx) => OnBoard()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimaryColor,
      body: ListView(
      
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Positioned(
                top: 100,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 500,
                    width: 500,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/loading.jpg'
                        ),
                        
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 230,
              ),
               Column(
                
                      children: [
                     
                        Positioned(
                          top: 300,
                          child: SpinKitSquareCircle(
                              size: 70.0,
                              itemBuilder: (context, index) {
                                final colors = [cAccentColor];
                                final color = colors[index % colors.length];
                                      
                                return DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: color,
                                    shape: BoxShape.rectangle,
                                  ),
                                );
                              }),
                        ),
                       
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong!'),
              );
            } else if (snapshot.hasData) {
              return  NavBar();
            } else {
              return const LoginS();
            }
          },
        ),
      );
}



