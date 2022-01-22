import 'package:flutter/material.dart';
import 'package:pro/main.dart';
import 'package:pro/bmi.dart';

class bmiresult extends StatelessWidget {
  int result;
  int age;
  bool isfamela;

  bmiresult(
    this.result,
    this.age,
    this.isfamela,
  );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("result"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isfamela ? Colors.pink[100] : Colors.blue[200]),
                child: Text(
                  " result = $result  \n  age = $age   ",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
