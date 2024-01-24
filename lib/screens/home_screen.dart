import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(160, 40),
                  backgroundColor: const Color(0xFF8D8BC5),
                ),
                child: const Text("Go Back", style: TextStyle(fontSize: 15.0, color: Color(0xFFF4F0F8)))
            )
          ],
        ),
      ),
    );
  }

}