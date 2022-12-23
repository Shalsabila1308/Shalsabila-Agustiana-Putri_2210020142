import 'dart:convert';
import 'dart:html';
import 'dart:js';
import 'dart:ui';
import 'package:bacaan_sholat/model/model_niat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class NiatSholat extends StatefulWidget {
  const NiatSholat({super.key});

  @override
  _NiatSholatState createState() => _NiatSholatState();
}

class _NiatSholatState extends State<NiatSholat> {
  Future<List<ModelNiat>> ReadJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/data/niatshalat.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => ModelNiat.froomJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff0e1446)),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: EdgeInsets.only(top: 120, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Niat Sholat Wajib",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Bacaan niat sholat wajib 5 waktu",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  child: Image.asset(
                    'assets/images/bg_sholat.png',
                    width: 330,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            child: FutureBuilder(
              future: ReadJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(
                    child: Text("${data.error}"),
                  );
                } else if (data.hasData) {
                  var items = data.data as List<ModelNiat>;
                  return ListView.builder(
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (context, index){
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(15),
                        child: Theme(data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile( 
                          title:Text(items[index].name.toString(),
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                ),
                                )
                          ],
                          )),
                      ),
                    }
                    )
                  
                }
              },
            ),
          ))
        ],
      )),
    );
  }
}
