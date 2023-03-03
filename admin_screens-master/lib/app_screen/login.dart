import 'package:admin_project/Api/database_helper.dart';
import 'package:admin_project/app_screen/admin_board.dart';
import 'package:flutter/material.dart';

class log_in extends StatefulWidget {
  const log_in(this.language, {super.key});
  final int language;
  @override
  State<StatefulWidget> createState() => log_inState(language);
}

class log_inState extends State<log_in> {
  final int language;
  log_inState(this.language);
  final GlobalKey<FormState> _log_informkey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final wordController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  DatabaseHelper _databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 145, 162, 188),
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
            height: screenHeight / 1.3,
            width: screenWidth / 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 229, 234, 237),
                    Color.fromARGB(255, 188, 178, 178),
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 30,
                    color: Colors.black12,
                  )
                ]),
            child: Form(
                key: _log_informkey,
                child: Expanded(
                  child: ListView(children: [
                    Align(
                      alignment: language == 2
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          language == 1 ? 'Log in:' : "تسجيل الدخول",
                          style: const TextStyle(
                            fontSize: 50.0,
                            color: Color.fromARGB(255, 11, 35, 55),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 55.0, left: 10.0, right: 22.0, bottom: 10.0),
                        child: SizedBox(
                            height: screenHeight / 15,
                            width: screenWidth / 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: usernameController,
                                textDirection: language == 2
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                                // controller: userController,
                                decoration: InputDecoration(
                                  hintText: language == 1
                                      ? "Username"
                                      : "اسم المستخدم",
                                  hintTextDirection: language == 2
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  suffixIcon: const Icon(Icons.person,
                                      color: Color.fromARGB(255, 11, 35, 55)),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 11, 35, 55)),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 11, 35, 55)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'please enter correct username';
                                  }
                                  return null;
                                },
                              ),
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 55.0, left: 10.0, right: 22.0, bottom: 10.0),
                        child: SizedBox(
                            height: screenHeight / 15,
                            width: screenWidth,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                obscureText: true,
                                textDirection: language == 2
                                    ? TextDirection.rtl
                                    : TextDirection.ltr,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  hintText: language == 1
                                      ? "password"
                                      : 'كلمة المرور',
                                  hintTextDirection: language == 2
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  suffixIcon: const Icon(Icons.lock,
                                      color: Color.fromARGB(255, 11, 35, 55)),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 11, 35, 55)),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(255, 11, 35, 55)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'pease inter correct password';
                                  }
                                  return null;
                                },
                              ),
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 55.0, left: 10.0, right: 22.0, bottom: 10.0),
                        child: Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 70, left: 70),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 11, 35, 55)),
                                  //end coloring
                                  //start bordering
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ))),
                              child: Text(
                                language == 1 ? 'login' : 'تسجيل الدخول',
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () async {
                                if (_log_informkey.currentState!.validate()) {
                                  await _databaseHelper.login(
                                      usernameController.text,
                                      passwordController.text);
                                  if (await _databaseHelper.login(
                                          usernameController.text,
                                          passwordController.text) ==
                                      'Incorrect username or password') {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              title: new Text('Error'),
                                              content: new Text(
                                                  'Incorrect lgin credintials'),
                                              actions: <Widget>[
                                                new ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary:
                                                                Color.fromARGB(
                                                                    255,
                                                                    11,
                                                                    35,
                                                                    55)),
                                                    child: new Text(
                                                      'Close',
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    })
                                              ]);
                                        });
                                  } else {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return board(language);
                                    }));
                                  }
                                }
                              },
                            ),
                          ),
                        )),
                    Center(
                      child: Text(
                        language == 1
                            ? 'Forget Password?'
                            : 'هل نسيت كلمة المرور؟',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 11, 35, 55),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
                )),
          ),
        ));
  }
}
