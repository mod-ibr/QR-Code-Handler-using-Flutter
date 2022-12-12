import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQRScreen extends StatefulWidget {
  @override
  _ScanQRScreenState createState() => _ScanQRScreenState();
}

class _ScanQRScreenState extends State<ScanQRScreen> {
  String scannedData = "Start Scen To Show your QR Code Data";
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber[900],
          title: const Text('Scan QR code'),
        ),
        body: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                (scannedData != (-1).toString())
                    ? scannedData.toString()
                    : "Start Scen To Show your QR Code Data",
                style: TextStyle(color: Colors.amber[900]!, fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: scan,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFF6F00)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
                child: const Text(('Start Scan')),
              ),
            ],
          ),
        ));
  }

  Future scan() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#FF6F00', 'cancel', true, ScanMode.QR)
          .then((value) {
        setState(() {
          scannedData = value;
        });
      });
    } catch (e) {
      setState(() {
        scannedData = 'Failed To Scan QR Code';
      });
    }
  }
}
