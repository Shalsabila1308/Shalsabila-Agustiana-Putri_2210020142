import 'dart:html';
import 'dart:ui';

import 'package:bacaan_sholat/main.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Container(
                margin: EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {},
                    child: Column(
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/ic_niat.png"),
                        height:100,
                        width: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Niat Shalat", 
                        style: TextStyle(
                          fontSize:14, fontWeight: FontWeight.bold),
                        )
                      ]
                    )
                  )
                ),
              ),
              SizedBox(
                height: 40,
                ),
                Container(
                margin: EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {},
                    child: Column(
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/ic_doa.png"),
                        height:100,
                        width: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Bacaan Shalat", 
                        style: TextStyle(
                          fontSize:14, fontWeight: FontWeight.bold),
                        )
                      ]
                    )
                  )
                ),
              ),
              SizedBox(
              height:40,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {},
                    child: Column(
                      children: <Widget>[
                        Image(image: AssetImage("assets/images/ic_bacaan.png"),
                        height:100,
                        width: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Ayat Kursi", 
                        style: TextStyle(
                          fontSize:14, fontWeight: FontWeight.bold),
                        )
                      ]
                    )
                  )
                ),
              ),
                ],
          ),
        ),
      ),
    );
  }
}
