import 'package:cc206_benta/src/shared-components/custom-widgets/dashboard-bottom-nav-bar.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-top-nav-label.dart';
import 'package:flutter/material.dart';

class Sales extends StatefulWidget {
  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  int _selectedIndex = 2; 

  double grossSalesThisYear = 50567.00;
  double grossSalesLastYear = 45029.00;

  final List<Map<String, String>> salesByPaymentMethod = [
    {'label': 'On the counter', 'value': '71%'},
    {'label': 'Debit/Credit', 'value': '29%'},
  ];

  final List<Map<String, String>> salesByItemCategory = [
    {'label': 'Canned Goods', 'value': '50%'},
    {'label': 'Frozen Foods', 'value': '31%'},
    {'label': 'Dairy', 'value': '19%'},
  ];

  final List<Map<String, String>> salesGrowth = [
    {'label': 'November', 'value': '5.05%'},
    {'label': 'October', 'value': '1.7%'},
    {'label': 'September', 'value': '2.5%'},
    {'label': 'August', 'value': '1.5%'},
    {'label': 'July', 'value': '1.6%'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void updateSales(double thisYear, double lastYear) {
    setState(() {
      grossSalesThisYear = thisYear;
      grossSalesLastYear = lastYear;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 50),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GeneralTopNavLabel(label: 'Sales', iconName: 'stack-of-coins-grey.png'),
              const SizedBox(height: 20),
              // Gross Sales this year
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gross Sales this year',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF579008),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₱ ${grossSalesThisYear.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF579008),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Gross Sales last year
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gross Sales last year',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF787878),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '₱ ${grossSalesLastYear.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF787878),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '↑ ${(100 * (grossSalesThisYear - grossSalesLastYear) / grossSalesLastYear).toStringAsFixed(1)}%',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF579008),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Dynamic Cards
              Center(
                child: _buildCard(
                  title: 'Sales by Payment Method',
                  width: 301,
                  height: 122,
                  data: salesByPaymentMethod,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: _buildCard(
                  title: 'Sales by Item Category',
                  width: 301,
                  height: 149,
                  data: salesByItemCategory,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: _buildCard(
                  title: 'Sales Growth',
                  width: 301,
                  height: 208,
                  data: salesGrowth,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DashboardBottomNavBar()
    );
  }

  Widget _buildCard({
    required String title,
    required List<Map<String, String>> data,
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFF1F1F1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return _buildListItem(item['label'] ?? '', item['value'] ?? '');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
