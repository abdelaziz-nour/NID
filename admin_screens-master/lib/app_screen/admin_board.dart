import 'dart:convert';

import 'package:admin_project/app_screen/conf.dart';
import 'package:admin_project/app_screen/report.dart';
import 'package:admin_project/app_screen/requests.dart';
import 'package:flutter/material.dart';

class board extends StatefulWidget {
  board(this.language, {super.key});
  final int language;
  @override
  State<StatefulWidget> createState() {
    return boardState(language);
  }
}

class boardState extends State<board> {
  final int language;
  boardState(this.language);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 206, 214, 226),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 11, 35, 55),
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(
                    'images/im.jpg.jpg',
                  )),
            ),
            elevation: 0,
            actions: [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 135, 159, 196),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(
                      'images/im.jpg.jpg',
                    )),
              ),
            ]),
        body: Center(
          child: Container(
              height: screenHeight / 1.2,
              width: screenWidth / 2.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 186, 203, 228),
                      Color.fromARGB(255, 102, 145, 180),
                    ],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 15),
                      blurRadius: 30,
                      color: Colors.black12,
                    )
                  ]),
              child: Expanded(
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                    radius: screenWidth / 10,
                    backgroundColor: const Color.fromARGB(255, 206, 214, 226),
                    child: getImageAsset(),
                  ),
                ),
                Row(children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50, right: 25, left: 25),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 11, 35, 55)),
                              //end coloring
                              //start bordering
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60.0),
                              ))),
                          child: Column(
                            children: [
                              Icon(Icons.person_search),
                              Text(
                                language == 1 ? 'Requests' : 'طلبات التجديد ',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return requests(language);
                              }),
                            );
                          }),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50, right: 20, left: 20),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 11, 35, 55)),
                              //end coloring
                              //start bordering
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ))),
                          child: Column(
                            children: [
                              Icon(Icons.co_present_rounded),
                              Text(
                                language == 1 ? 'confirmation' : 'التأكيد',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return conf(language);
                              }),
                            );
                          }),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 50, right: 25, left: 25),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 11, 35, 55)),
                              //end coloring
                              //start bordering
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ))),
                          child: Column(
                            children: [
                              Icon(Icons.report_problem_outlined),
                              Text(
                                language == 1 ? 'report' : " التقارير",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return report(language);
                              }),
                            );
                          }),
                    ),
                  )
                ])
              ]))),
        ));
  }
}

Widget getImageAsset() {
  AssetImage assetimage = const AssetImage('images/im.jpg.jpg');
  Image image = Image(
    image: assetimage,
    width: 150.0,
    height: 150.0,
  );

  return ClipRRect(
    borderRadius: BorderRadius.circular(100.0),
    clipBehavior: Clip.hardEdge,
    child: image,
  );
}
