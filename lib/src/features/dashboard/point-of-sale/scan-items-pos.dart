import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-bottom-nav-bar.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/pos-transaction-item-button.dart';

class ScanItemPage extends StatefulWidget {
  @override
  _ScanItemPageState createState() => _ScanItemPageState();
}

class _ScanItemPageState extends State<ScanItemPage> {
  String scannedBarcode = '';

  Future<void> startBarcodeScan() async {
    try {
      String barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );

      if (barcode != '-1') {
        setState(() {
          scannedBarcode = barcode;
        });
      }
    } catch (e) {
      setState(() {
        scannedBarcode = 'Failed to get the barcode.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height,
              margin: const EdgeInsets.only(top: 40, bottom: 90),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Scan an item to add to the transaction:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: startBarcodeScan,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                    ),
                    child: const Text(
                      'Scan Barcode',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    scannedBarcode.isNotEmpty
                        ? 'Scanned Barcode: $scannedBarcode'
                        : 'No barcode scanned yet.',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  PosTransactionItemButton(
                    itemName: 'Ligo Sardines in Tomato Sauce',
                    itemImg: 'assets/ligo_sardines.png',
                    price: '₱24.50',
                    onPressed: () {},
                  ),
                  PosTransactionItemButton(
                    itemName: 'CDO Homestyle Corned Beef',
                    itemImg: 'assets/cdo_corned_beef.png',
                    price: '₱35.30',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          GeneralBottomNavBar(
            navItems: 2,
            navLabels: ['Back', 'Save'],
            navActions: [
              () => Navigator.pushNamed(context, '/dashboard/point-of-sale'),
              () => Navigator.pushNamed(context, '/dashboard/point-of-sale/checkout/receipt'),
            ],
          ),
        ],
      ),
    );
  }
}
