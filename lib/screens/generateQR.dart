import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class GenerateQRScreen extends StatefulWidget {
  const GenerateQRScreen({super.key});

  @override
  _GenerateQRScreenState createState() => _GenerateQRScreenState();
}

class _GenerateQRScreenState extends State<GenerateQRScreen> {
  String stringToGenerateQR = 'Generate QR';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber[900],
        title: const Text('Generate QR code'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            BarcodeWidget(
              data: stringToGenerateQR,
              barcode: Barcode.qrCode(),
              color: Colors.amber[900]!.withOpacity(0.75),
              height: MediaQuery.of(context).size.height * 0.36,
              width: MediaQuery.of(context).size.height * 0.36,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    stringToGenerateQR = val;
                  });
                },
                decoration: InputDecoration(
                  label: const Text('Enter Your data To Generate Qr Code.'),
                  labelStyle: const TextStyle(color: Colors.black54),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.amber[900]!,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.amber[400]!,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide(
                      color: Colors.amber[900]!,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
