import 'package:demo_app/screens/connect_screen.dart';
import 'package:demo_app/screens/home_screen.dart';
import 'package:demo_app/screens/signin_screen.dart';
import 'package:demo_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => ConnectScreen(),
        '/signin': (context) => SignInScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "hello world",
        ),
      ),
      body: Column(
        children: [
          Text(
            "Hello world",
            style: TextStyle(color: Colors.orange, fontSize: 20),
          ),
          ElevatedButton(onPressed: (){print("hello world");}, child: Text("Press me!!"), style: ElevatedButton.styleFrom(backgroundColor: Colors.red),)
        ],
      ),
    );
  }
}
