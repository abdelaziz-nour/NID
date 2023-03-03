//import 'package:dd/cc.dart';
import 'package:admin_project/Api/database_helper.dart';
import 'package:admin_project/app_screen/box.dart';
import 'package:flutter/material.dart';

class conf extends StatefulWidget {
  conf(this.language, {super.key});
  final int language;
  @override
  State<StatefulWidget> createState() {
    return confState(language);
  }
}

class confState extends State<conf> {
  final GlobalKey<FormState> _process_numformkey = GlobalKey<FormState>();
  final process_numController = TextEditingController();

  DatabaseHelper _databaseHelper = DatabaseHelper();
  final int language;
  confState(this.language);
  @override
  var pressed = false;
  Widget build(BuildContext context) {
    var boxx = box(language, '', "");
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 214, 226),
      body: ListView(shrinkWrap: true, children: [
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth / 10,
              right: screenWidth / 10,
              top: screenHeight / 10),
          child: Align(
            alignment: language == 1 ? Alignment.topLeft : Alignment.topRight,
            child: Text(
              language == 1 ? '  Confirmation' : "التأكيد",
              style: TextStyle(
                fontSize: 50.0,
                color: Color.fromARGB(255, 11, 35, 55),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                left: screenWidth / 6,
                right: screenWidth / 6,
                top: screenHeight / 10),
            child: SizedBox(
                height: screenHeight / 7,
                width: screenWidth,
                child: TextFormField(
                    controller: process_numController,
                    key: _process_numformkey,
                    decoration: InputDecoration(
                      hintText: language == 1
                          ? " Enter process number"
                          : "أدخل رقم العمليه",
                      hintTextDirection:
                          language == 1 ? TextDirection.ltr : TextDirection.rtl,
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 11, 35, 55)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 11, 35, 55)),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          value != process_numController.text) {
                        return 'please enter correct process number';
                      }
                    }))),
        Padding(
            padding:
                EdgeInsets.only(left: screenWidth / 3, right: screenWidth / 3),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 11, 35, 55)),
                    //end coloring
                    //start bordering
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ))),
                child: Text(
                  language == 1 ? 'ok' : 'تم',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  _databaseHelper.showMyDialog(
                      context: context,
                      title: 'title',
                      content: 'content',
                      page: conf(1),
                      controller: process_numController.text);
                })),
      ]),
    );
  }
}

class CasesClass extends StatelessWidget {
  final int language;
  final list;
  CasesClass(this.language, this.list);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
   // print("11111111");
    print(list[0]['name']);
    return Container(
        // margin: EdgeInsets.symmetric(
        //     horizontal: screenWidth / 4, vertical: screenHeight / 9),
        // height: screenHeight / 5,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            height: screenHeight / 3,
            width: screenWidth / 3,
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
              // right: screenWidth / 10,
              // top: screenHeight / 19,
              child: SizedBox(
                height: screenHeight / 3.4,
                width: screenWidth / 3.4,
                child: Text(
                  list[0]['name'],
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Positioned(
               right: screenWidth / 3,
              // top: screenHeight / 19,
              child: SizedBox(
                height: screenHeight / 5,
                width: screenWidth / 5,
                child: Text(
                  list[0]['payment_date'],
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ]));
    //return box(language, list[0]['name'], list[0]['payment_date']);
  }
}
