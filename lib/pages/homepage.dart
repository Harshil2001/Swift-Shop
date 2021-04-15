import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:de1/ResultModel.dart';

class HomePage extends StatefulWidget {

  final ValueSetter<ResultModel> _valueSetter;
  HomePage(this._valueSetter);

  @override
  HomePageState createState() {
    return new HomePageState((prodselected) {
      _valueSetter(prodselected);
    });
  }

  /*sendresult() {
    return HomePageState().initialresult;
  } */
}

class HomePageState extends State<HomePage> {
  final ValueSetter<ResultModel> _valueSetter;
  HomePageState(this._valueSetter);

  String initialresult = "Hey there !";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();

      String str = qrResult;
      print(qrResult);
      List arr = str.split(',');
      print(arr);
      String x = arr[0];
      String y = arr[1];
      int z = int.parse(arr[2]);
      ResultModel t = ResultModel(x,y,z);
      _valueSetter(t);

      setState(() {
        /*String str = qrResult;
        List arr = str.split(',');
        print(arr);
        String x = arr[0];
        String y = arr[1];
        int z = int.parse(arr[2]);
        ResultModel t = ResultModel(x,y,z);
        _valueSetter(t); */

        initialresult = qrResult;
      });

    } on PlatformException catch (ex) {
      /*if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });*/
    }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
        child: Text(
          initialresult,
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),

      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );

  }
}