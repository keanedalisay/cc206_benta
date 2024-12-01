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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 24),
                    Row(
                      children: [
                        const Icon(Icons.monetization_on, color: Colors.grey, size: 28),
                        const SizedBox(width: 8),
                        Text(
                          'Sales',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Gross Sales this year
              Padding(
                padding: const EdgeInsets.only(right: 80.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gross Sales this year',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '₱ ${grossSalesThisYear.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Gross Sales last year
              Padding(
                padding: const EdgeInsets.only(left: 80.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gross Sales last year',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
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
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '↑ ${(100 * (grossSalesThisYear - grossSalesLastYear) / grossSalesLastYear).toStringAsFixed(1)}%',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.green,
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
      bottomNavigationBar: Container(
        height: 100,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Icon(Icons.dashboard, size: 28),
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Icon(Icons.inventory, size: 28),
                ),
                label: 'Inventory',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Icon(Icons.monetization_on, size: 28),
                ),
                label: 'Sales',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            backgroundColor: const Color(0xFF579008),
            onTap: _onItemTapped,
            iconSize: 28,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
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
        border: Border.all(color: Colors.grey, width: 1),
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
