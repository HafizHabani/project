import 'dart:io';
import 'package:flutter/material.dart';
import 'package:projectmppl/penyewa/homepenyewa.dart';

class pembayaran extends StatefulWidget {
  @override
  State<pembayaran> createState() => _pembayaranState();
}

class _pembayaranState extends State<pembayaran> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent[700],
          elevation: 0,
          toolbarHeight: 80,
          leading: IconButton(
            icon: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.arrow_downward,
                color: Colors.black,
                size: 50.0,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => homepenyewa()),
              );
            },
          ),
          title: Text(
            'Pembayaran',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://cdn.pixabay.com/photo/2017/11/02/14/26/model-2911329_960_720.jpg",
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow[100],
                            border: Border.all(
                              color: Colors.orangeAccent,
                              width: 5,
                            )),
                        padding: EdgeInsets.all(13.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Rysa Laksana",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "BRI :",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "7318072318371",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://cdn.pixabay.com/photo/2017/11/02/14/26/model-2911329_960_720.jpg",
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow[100],
                            border: Border.all(
                              color: Colors.orangeAccent,
                              width: 5,
                            )),
                        padding: EdgeInsets.all(13.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Rysa Laksana",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "BRI :",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "7318072318371",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://cdn.pixabay.com/photo/2017/11/02/14/26/model-2911329_960_720.jpg",
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow[100],
                            border: Border.all(
                              color: Colors.orangeAccent,
                              width: 5,
                            )),
                        padding: EdgeInsets.all(13.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Rysa Laksana",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "BRI :",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "7318072318371",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          "https://cdn.pixabay.com/photo/2017/11/02/14/26/model-2911329_960_720.jpg",
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow[100],
                            border: Border.all(
                              color: Colors.orangeAccent,
                              width: 5,
                            )),
                        padding: EdgeInsets.all(13.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Rysa Laksana",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "BRI :",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "7318072318371",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
