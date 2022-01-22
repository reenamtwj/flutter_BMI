import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pro/bmiresult.dart';
import 'package:pro/main.dart';

class bmi extends StatefulWidget {
  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  bool isfamale = true;
  int height = 170;
  int age = 20;
  int we = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI calcolator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          !isfamale ? isfamale = true : isfamale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isfamale ? Colors.pink[100] : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.remove_red_eye,
                              size: 90,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isfamale ? isfamale = false : isfamale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isfamale ? Colors.grey : Colors.blue[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.visibility_off,
                              size: 90,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: TextStyle(fontSize: 35),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$height",
                        style: TextStyle(fontSize: 40),
                      ),
                      Text("cm"),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      max: 220,
                      min: 100,
                      activeColor:
                          isfamale ? Colors.pink[100] : Colors.blue[200],
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      }),
                ],
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: TextStyle(fontSize: 35),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "$age",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: isfamale
                                  ? Colors.pink[100]
                                  : Colors.blue[200],
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              heroTag: "age-",
                              mini: true,
                              child: Icon(Icons.remove),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              backgroundColor: isfamale
                                  ? Colors.pink[100]
                                  : Colors.blue[200],
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              heroTag: "age+",
                              mini: true,
                              child: Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(fontSize: 35),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("$we", style: TextStyle(fontSize: 20)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  we--;
                                });
                              },
                              heroTag: "we-",
                              mini: true,
                              child: Icon(Icons.remove),
                              backgroundColor: isfamale
                                  ? Colors.pink[100]
                                  : Colors.blue[200],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              backgroundColor: isfamale
                                  ? Colors.pink[100]
                                  : Colors.blue[200],
                              onPressed: () {
                                setState(() {
                                  we++;
                                });
                              },
                              heroTag: "we+",
                              mini: true,
                              child: Icon(Icons.add),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isfamale ? Colors.pink[100] : Colors.blue[200],
                ),
                child: MaterialButton(
                  onPressed: () {
                    double result = we / pow(height / 100, 2);
                    print(result.round());

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return bmiresult(
                          result.round(),
                          age,
                          isfamale,
                        );
                      }),
                    );
                  },
                  child: Text("Calculate", style: TextStyle(fontSize: 15)),
                )),
          ),
        ],
      ),
    );
  }
}
