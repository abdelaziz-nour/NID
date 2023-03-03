import 'package:admin_project/app_screen/box.dart';
import 'package:admin_project/app_screen/detail.dart';
import 'package:flutter/material.dart';

import '../Api/database_helper.dart';

class requests extends StatefulWidget {
  requests(this.language, {super.key});
  final int language;
  @override
  State<StatefulWidget> createState() {
    return requestsState(language);
  }
}

class requestsState extends State<requests> {
  final int language;
  requestsState(this.language);
  DatabaseHelper _databaseHelper = DatabaseHelper();
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
        body: FutureBuilder(
            future: _databaseHelper.get_user_details(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView(children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth / 10,
                      right: screenWidth / 10,
                      top: screenHeight / 10),
                  child: Align(
                    alignment:
                        language == 1 ? Alignment.topLeft : Alignment.topRight,
                    child: Text(
                      language == 1
                          ? ' ID Card Requests  '
                          : 'طلبات تجديد البطاقه ',
                      textDirection:
                          language == 1 ? TextDirection.ltr : TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 50.0,
                        color: //Colors.white,
                            Color.fromARGB(255, 11, 35, 55),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                for (final item in snapshot.data ?? [])
                  Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: screenWidth / 4,
                          vertical: screenHeight / 9),
                      height: screenHeight / 5,
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                        Container(
                          height: screenHeight / 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color.fromARGB(255, 11, 35, 55),

                              //Colors.white,
                              // const Color.fromARGB(255, 172, 219, 232),
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 15),
                                  blurRadius: 30,
                                  color: Colors.black12,
                                )
                              ]),
                        ),
                        Positioned(
                            right: language == 1
                                ? screenWidth / 120
                                : screenWidth / 300,
                            top: screenHeight / 18,
                            child: SizedBox(
                              height: screenHeight / 2,
                              width: language == 1
                                  ? screenWidth / 2.2
                                  : screenWidth / 6,
                              child: Text(
                                item['FirstName'] +
                                    ' ' +
                                    item['SecondName'] +
                                    ' ' +
                                    item['ThirdName'] +
                                    ' ' +
                                    item['FourtName'],
                                // 'اروى يوسف عيد ادريس',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                        Positioned(
                            left: language == 1
                                ? screenWidth / 2.5
                                : screenWidth / 120,
                            bottom: screenHeight / 10,
                            top: screenHeight / 18,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Color.fromARGB(255, 230, 235, 241),
                                    ),

                                    //end coloring
                                    //start bordering
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ))),
                                child: Align(
                                  alignment: language == 1
                                      ? Alignment.topRight
                                      : Alignment.topLeft,
                                  child: Text(
                                    language == 1 ? 'Details' : 'التفاصيل',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 11, 35, 55),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    print("AAAAAAAAAAAAAAAAAAAAA");
                                    print(item);
                                    return datail(
                                      language,
                                      item,
                                    );
                                  }));
                                })),
                      ]))
              ]);
            }));
  }
}
