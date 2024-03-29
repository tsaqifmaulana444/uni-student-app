import 'package:flutter/material.dart';
import 'package:flutter_11_5_2023/screens/details.dart';
import 'package:flutter_11_5_2023/screens/formm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_11_5_2023/network/api.dart';
import 'dart:convert';
import 'login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user') ?? '');

    if (user != null) {
      setState(() {
        name = user['name'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        automaticallyImplyLeading: false,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.power_settings_new),
        //     onPressed: (){
        //       logout();
        //     },
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            // color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Hello, ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${name}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,                 
                  decoration: BoxDecoration(boxShadow: [
                    // BoxShadow(
                    //     color: Colors.grey,
                    //     spreadRadius: 5,
                    //     blurRadius: 7,
                    //     offset: Offset(0, 3))
                  ]),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black),
                        columns: [
                          DataColumn(
                            label:
                                Text('NIM', style: TextStyle(color: Colors.white)),
                          ),
                          DataColumn(
                            label:
                                Text('Nama', style: TextStyle(color: Colors.white)),
                          ),
                          DataColumn(
                            label: Text('Studi',
                                style: TextStyle(color: Colors.white)),
                          ),
                          DataColumn(
                            label: Text('Fakultas',
                                style: TextStyle(color: Colors.white)),
                          ),
                          DataColumn(
                            label: Text('TTL',
                                style: TextStyle(color: Colors.white)),
                          ),
                          DataColumn(
                            label: Text('Jenis Kelamin',
                                style: TextStyle(color: Colors.white)),
                          ),
                          DataColumn(
                            label: Text('Email',
                                style: TextStyle(color: Colors.white)),
                          ),
                          DataColumn(
                            label: Text('Created At',
                                style: TextStyle(color: Colors.white)),
                          ),
                          DataColumn(
                            label: Text('Action',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                        rows: [
                          DataRow(
                              color: MaterialStateColor.resolveWith(
                                  (states) => Colors.black),
                              cells: [
                                DataCell(Text(
                                  '1',
                                  style: TextStyle(color: Colors.white),
                                )),
                                DataCell(GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => Details())));
                                  },
                                  child: Text(
                                    'sadsad',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                                DataCell(Text('dasads',
                                    style: TextStyle(color: Colors.white))),
                                DataCell(Text('asd',
                                    style: TextStyle(color: Colors.white))),
                                DataCell(Text('asds',
                                    style: TextStyle(color: Colors.white))),
                                DataCell(Text('asds',
                                    style: TextStyle(color: Colors.white))),
                                DataCell(Text('asds',
                                    style: TextStyle(color: Colors.white))),
                                DataCell(Text('asds',
                                    style: TextStyle(color: Colors.white))),
                                DataCell(Row(
                                  children: [
                                     ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Home(),
                                                ));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              minimumSize: const Size(30, 30),
                                              backgroundColor:
                                                  Color.fromARGB(255, 223, 235, 60)),
                                          child: Icon(
                                            Icons.edit_outlined,
                                            size: 20,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                     ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Home(),
                                                ));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              minimumSize: const Size(30, 30),
                                              backgroundColor:
                                                  const Color(0xFFEB5F3C)),
                                          child: Icon(
                                            Icons.delete_outline,
                                            size: 20,
                                          ),
                                        )
                                  ],
                                )),
                              ]),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 19),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyForm(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: const Color(0xFF44B5ED)),
                    child: const Text("Insert"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void logout() async {
    var res = await Network().getData('/logout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    }
  }
}



