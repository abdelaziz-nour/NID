import 'package:admin_project/Api/database_helper.dart';
import 'package:admin_project/app_screen/admin_board.dart';
import 'package:flutter/material.dart';

class final_report extends StatefulWidget {
  final_report(this.language, this.startdate, this.enddate, this.center);
  final startdate;
  final enddate;
  final center;
  final int language;
  @override
  State<StatefulWidget> createState() {
    return final_reportState(
        this.language, this.startdate, this.enddate, this.center);
  }
}

class final_reportState extends State<final_report> {
  final int language;
  final startdate;
  final enddate;
  final center;
  final_reportState(this.language, this.startdate, this.enddate, this.center);
  @override
  Widget build(BuildContext context) {
    DatabaseHelper _databasehelper = DatabaseHelper();
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
        body: ListView(children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 20),
                child: Text(
                  ' Report:  ',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Color.fromARGB(255, 11, 35, 55),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 30, left: 0),
              //   child: Text(
              //     ' 150  ',
              //     style: TextStyle(
              //       fontSize: 50.0,
              //       color: Color.fromARGB(255, 255, 255, 255),
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
            ],
          ),
          FutureBuilder<dynamic>(
            future: _databasehelper.reports(startdate, enddate, center),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? new CasesClass(snapshot.data)
                  : new Center(
                      child: new CircularProgressIndicator(),
                    );
            },
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 11, 35, 55)),
                      //end coloring
                      //start bordering
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ))),
                  child: Text(
                    language == 1 ? 'ok' : 'تم',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return board(language);
                    }));
                  },
                ),
              ),
            ),
          )
        ]));
  }
}

class CasesClass extends StatelessWidget {
  var list;
  CasesClass(this.list);
  @override
  Widget build(BuildContext context) {
    print('SSSSSSSSSSSSSSS');
    print(list);
    Map map = list.asMap();

    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: list == null ? 0 : 1,
            itemBuilder: (context, index) {
              return Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: Text(
                            'No',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 11, 35, 55),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Frist name',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 11, 35, 55),
                            ),
                          ),
                        ),
                        // DataColumn(
                        //   label: Text(
                        //     'ID Number',
                        //     style: TextStyle(
                        //       fontStyle: FontStyle.italic,
                        //       color: Color.fromARGB(255, 11, 35, 55),
                        //     ),
                        //   ),
                        // ),
                        DataColumn(
                          label: Text(
                            'ID Nuumber',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 11, 35, 55),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Status',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Color.fromARGB(255, 11, 35, 55),
                            ),
                          ),
                        ),
                      ],
                      rows: map.entries
                          .map(
                            (entry) => DataRow(
                              cells: [
                                DataCell(Text((entry.key + 1).toString())),
                                DataCell(Text(entry.value['FirstName'] +' '+
                                    entry.value['SecondName'] +' '+
                                    entry.value['ThirdName'] +' '+
                                    entry.value['FourtName'])),
                                DataCell(
                                    Text((entry.value['Old_id'].toString()))),
                                DataCell(Text((entry.value['statu']))),
                                // DataCell(Text((entry.value['aa']).toString())),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              );
            }),
        Center(
          child: Text(
            'Total cardid are : ${list.length}',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color.fromARGB(255, 11, 35, 55),
            ),
          ),
        )
      ],
    );
  }
}

        /*
        Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top:80.0),
                child: DataTable(
                          headingRowColor:
                              MaterialStateColor.resolveWith((states) => const Color.fromARGB(255, 11, 35, 55)),
                          dataRowColor:
                              MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 255, 255, 255)),
                          columns: [
                            DataColumn(
                              label: Text("Name",
                              style:TextStyle(
                                 color: Colors.white,
                                 fontSize: 25,
                                 fontWeight: FontWeight.bold,
                ),
                              ),

                            ),
                            DataColumn(
                              label: Text("date",
                              style:TextStyle(
                                 color: Colors.white,
                                 fontSize: 25,
                                 fontWeight: FontWeight.bold,
                ),
                              ),
                            ),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "Mai salah aldeen ali",

                                  ),
                                ),
                                DataCell(
                                  Text("12-1-2023",
                                 
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
              ),
            ),
          ),
        */