import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      home: NumpadScreen(),
    );
  }
}

class NumpadScreen extends StatefulWidget {
  @override
  _NumpadScreenState createState() => _NumpadScreenState();
}

class _NumpadScreenState extends State<NumpadScreen> {
  final TextEditingController _controller = TextEditingController();

  void _onNumberPressed(String number) {
    setState(() {
      _controller.text += number;
    });
  }

  void _onDeletePressed() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _controller.text = _controller.text.substring(0, _controller.text.length - 1);
      }
    });
  }

  void _onClearPressed() {
    setState(() {
      _controller.clear();
    });
  }

  void _onOkPressed() {
    print("OK pressed with value: ${_controller.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 22,
            right: 15,
            child: Image.asset(
              'assets/images/POS_checkout.png',
              width: 137,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 66,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Net Total',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF579008),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '₱120.00',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    color: Color(0xFF579008),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 185,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transaction Date: 01/01/2024',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF787878),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Transaction ID: AFD1-3451',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF787878),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 270,
            left: (MediaQuery.of(context).size.width / 2) - 137,
            child: Text(
              'Tendered amount',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.normal,
                color: Color(0xFF212121),
              ),
            ),
          ),
          Positioned(
            top: 260,
            left: (MediaQuery.of(context).size.width / 2) - 137,
            child: Container(
              width: 260,
              height: 0,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xFFF1F1F1),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 340,  // Adjusted to position below the previous text field
            left: (MediaQuery.of(context).size.width / 2) - 137,
            child: Text(
              'Change from Tender',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.normal,
                color: Color(0xFF212121),
              ),
            ),
          ),
          Positioned(
            top: 293,
            left: 120,
            child: SizedBox(
              width: 250,
              height: 40,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFFCFCFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFF787878), width: 1),
                  ),
                ),
                keyboardType: TextInputType.number,
                readOnly: false,
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: (MediaQuery.of(context).size.width / 2) - 137,
            child: Container(
              width: 243,
              height: 248,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRow(['7', '8', '9', 'Del']),
                  _buildRow(['4', '5', '6', 'C']),
                  _buildRow(['1', '2', '3', 'OK']),
                  _buildZeroRow(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                color: Color(0xFF579008),
                borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Back',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Finish',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((item) {
        if (item == 'Del') return _buildDelButton();
        if (item == 'C') return _buildClearButton();
        if (item == 'OK') return _buildDoneButton();
        return _buildNumButton(item);
      }).toList(),
    );
  }

  Widget _buildZeroRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildNumButton('0'),
      ],
    );
  }

  Widget _buildNumButton(String number) {
    return GestureDetector(
      onTap: () {
        _onNumberPressed(number);
      },
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          shape: BoxShape.circle,
        ),
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xFF212121),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDelButton() {
    return GestureDetector(
      onTap: _onDeletePressed,
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          shape: BoxShape.circle,
        ),
        child: const Text(
          'Del',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF212121),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildClearButton() {
    return GestureDetector(
      onTap: _onClearPressed,
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          shape: BoxShape.circle,
        ),
        child: const Text(
          'C',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFFA70000),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDoneButton() {
    return GestureDetector(
      onTap: _onOkPressed,
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          shape: BoxShape.circle,
        ),
        child: const Text(
          'OK',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF212121),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
