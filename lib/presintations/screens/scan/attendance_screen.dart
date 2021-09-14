import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr/themes/appStyleConfig.dart';
import 'package:hr/utilities/constans/strings.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'locationModel.dart';
import 'package:location/location.dart';

class AttendanceScreen extends StatefulWidget {
  AttendanceScreen({Key? key}) : super(key: key);

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final Map<String, double> locationMap = {
    "laltitude": 0.0,
    "longitude": 0.0,
  };

  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  double? currentLatitude;

  double? currentLongitude;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendace In Screen"),
        backgroundColor: AppStyleConfig.primaryColor,
      ),
      body: Column(
        children: [
          Container(
              height: 10, width: width, color: AppStyleConfig.accentColor),
          Expanded(
            flex: 2,
            child: Container(
              child: _buildQrView(context),
            ),
          ),
          Container(
              height: 10, width: width, color: AppStyleConfig.accentColor),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 250.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.blueGrey,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _getCurrentLocation();
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
        final barcode = barcodeModelFromJson(scanData.code);
        print(currentLatitude);
        print(barcode.latitude);

      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    final locData = await Location().getLocation();
    setState(() {
      this.currentLatitude = locData.latitude;
      this.currentLongitude = locData.longitude;
    });
  }
}
