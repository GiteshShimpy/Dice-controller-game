import 'dart:developer' as dev;
import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Dice_play", debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppBody();
  }
}

class MyAppBody extends State<MyApp> {
  int leftdice = 1;
  int rightdice = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 105, 103, 104),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 120, 123, 119),
        centerTitle: true,
        title: Text("Dice_play"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Expanded(child: Image.asset("images/dice$leftdice.png")),
                    Expanded(child: Image.asset("images/dice$rightdice.png")),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 85.0, top: 180),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 52, 191, 255),
                        shadowColor: Colors.grey,
                        minimumSize: Size(100.0, 20.0),
                      ),
                      onPressed: () {
                        final Random rand = Random();
                        setState(
                          () {
                            leftdice = rand.nextInt(6) + 1;
                            rightdice = rand.nextInt(6) + 1;
                            if (leftdice == rightdice) {
                              if (leftdice == 6) {
                                rightdice = leftdice - 1;
                              } else {
                                rightdice = leftdice + 1;
                              }
                            }
                          },
                        );
                      },
                      child: Text(
                        'Play',
                        style: TextStyle(
                            color: Color.fromARGB(255, 231, 235, 237)),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 180),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 52, 191, 255),
                      minimumSize: Size(100.0, 20.0),
                    ),
                    onPressed: () {
                      setState(() {
                        leftdice = 1;
                        rightdice = 4;
                      });
                    },
                    child: Text(
                      'Reset',
                      style:
                          TextStyle(color: Color.fromARGB(255, 234, 236, 237)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
