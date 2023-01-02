import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: Color.fromARGB(255, 252, 250, 244),
            height: Get.width * 0.03,
            child: Row(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 50,
                    child: Text("M")),
                Text(
                  "Mauro Rodrigues da Silva",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(width: Get.width * 0.6),
                Row(
                  children: [
                    Icon(
                      Icons.code,
                      color: Color.fromARGB(255, 19, 15, 1),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {},
                      child: Text("Experience"),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {},
                      child: Text("Projects"),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {},
                      child: Text("My Projects"),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: Get.width * 0.5,
                height: Get.height * 0.9,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Hi!",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text(
                          "My name is Mauro",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Mobile App developer with Dart/Flutter",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w200),
                        ),
                        FlutterLogo(),
                        SizedBox(height: 20),
                        Text(
                          "Passionate mobile development",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Container(
                          color: Color.fromARGB(255, 245, 245, 245),
                          width: 500,
                          child: RichText(
                            text: TextSpan(
                              text:
                                  "Flutter is an Open-Source UI SDK developed by Google. It allows the development of iOS/Android apps and uses Dart as the programming language. Dart is an Open-Source, client-side programming language. It is easy to learn, stable, and creates high-performance applications.",
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: Get.width * 0.5,
                height: Get.height * 0.9,
                color: Color.fromARGB(255, 185, 193, 198),
              )
            ],
          ),
          Text("Time"),
        ],
      ),
    );
  }
}
