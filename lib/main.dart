import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/responsive/responsive_layout_screen.dart';
import 'package:instagram_flutter/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter/responsive/web_screen_layout.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb)
  {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyCvXUxjxCJaazTUl10iDfbVp1ubFF7h07c', 
      appId: '1:1058392679783:web:700ed4a5a7cb7060c8fbc2', 
      messagingSenderId: '1058392679783', 
      projectId: 'instagram-tut-25e7e',
      storageBucket: 'instagram-tut-25e7e.appspot.com',
      ),
      );
  }
  else {
  await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
        ),
      //home: const ResponsiveLayout(webScreenLayout: WebScreenLayout(), mobileScreenLayout: MobileScreenLayout(),
      //), //Responsive Layout

      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(), 
        webScreenLayout: WebScreenLayout(),
        ),
    ); //Material App 
  }
}