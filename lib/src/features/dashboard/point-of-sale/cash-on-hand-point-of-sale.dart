import 'package:cc206_benta/src/shared-components/custom-widgets/general-bottom-nav-bar.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-top-nav-label.dart';
import 'package:flutter/material.dart';

class Checkout2 extends StatefulWidget {
  @override
  _Checkout2State createState() => _Checkout2State();
}

class _Checkout2State extends State<Checkout2> {
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

  void _onDotPressed() {
    _controller.text += '.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.only(bottom: 90),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GeneralTopNavLabel(label: 'Checkout', iconName: 'cash-register.png'),
                        Text(
                          'Net Total',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF579008),
                          ),
                        ),
                        Text(
                          '₱120.00',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            color: Color(0xFF579008),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Transaction Date: 01/01/2024',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF787878),
                          ),
                        ),
                        Text(
                          'Transaction ID: ABCD-1234',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF787878),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
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
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Tendered Amount',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF212121),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
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
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                              textAlignVertical: TextAlignVertical.top,
                              readOnly: false,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(
                            'Change from tender',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF212121),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            '₱ 30.00',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF212121),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
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
                                SizedBox(height: 5),
                                _buildRow(['4', '5', '6', 'C']),
                                SizedBox(height: 5),
                                _buildRow(['1', '2', '3', '.']),
                                SizedBox(height: 5),
                                _buildZeroRow(),
                              ],
                            ),
                          )
                        )
                      ]
                  )
              )
          ),
          GeneralBottomNavBar(
              navItems: 2,
              navLabels: ['Back', 'Finish'],
              navActions: [
                () => Navigator.pushNamed(context, '/dashboard/point-of-sale/checkout/1'),
                    () => Navigator.pushNamed(context, '/dashboard/point-of-sale/checkout/receipt'),
              ]
          )
        ]
      )
    );
  }

  Widget _buildRow(List<String> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((item) {
        if (item == 'Del') return _buildDelButton();
        if (item == 'C') return _buildClearButton();
        if (item == '.') return _buildDotButton();
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

  Widget _buildDotButton() {
    return GestureDetector(
      onTap: _onDotPressed,
      child: Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          shape: BoxShape.circle,
        ),
        child: const Text(
          '.',
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
