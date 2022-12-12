import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_handler/screens/scanQR.dart';
import 'package:qr_handler/screens/generateQR.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Handler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'QR Handler'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.amber[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.all(8),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.amber[900]!),
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/1_qr.jpg'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GenerateQRScreen()));
                      if (kDebugMode) {
                        print('Generate QR code');
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amber[900]!),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                    child: const Text('Generate QR code'),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => ScanQRScreen()));
                      if (kDebugMode) {
                        print('Scan QR code');
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.amber[900]!),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                    ),
                    child: const Text('Scan QR code'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
