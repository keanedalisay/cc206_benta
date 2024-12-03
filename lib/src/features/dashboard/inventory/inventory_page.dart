import 'package:cc206_benta/src/shared-components/custom-widgets/dashboard-bottom-nav-bar.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-text-button.dart';
import 'package:cc206_benta/src/shared-components/custom-widgets/general-top-nav-label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'manage_items_page.dart';
import 'inventory_models.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:auto_size_text/auto_size_text.dart';

  class ChartData {
    ChartData(this.x, this.y);
    final String x;
    final double y;
  }


class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  List<ChartData> _chartData = [ChartData('Loading...', 100)]; 

  @override
  void initState() {
    super.initState();
    _loadChartData(); 
  }

  Future<void> _loadChartData() async {
      await Future.delayed(Duration.zero); 

      final inventoryModel = Provider.of<InventoryModel>(context, listen: false);

      Map<String, double> categoryValues = {};
      for (var item in inventoryModel.inventoryItems) {
        categoryValues[item.name] = (categoryValues[item.name] ?? 0) + item.quantity * item.price;
      }

      if (mounted) {
        setState(() {
          _chartData = categoryValues.entries.map((entry) => ChartData(entry.key, entry.value)).toList();
        if (_chartData.isEmpty) {
            _chartData = [ChartData("Empty", 0)];
          }
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryModel>(
      builder: (context, inventoryModel, child) {
        double totalValue = inventoryModel.inventoryItems.fold(
            0, (sum, item) => sum + item.quantity * item.price);

        final lowInventoryItems = inventoryModel.inventoryItems
            .where((item) => item.quantity <= item.minStock)
            .toList();

        // Category-wise inventory + item quantity for pie chart.
        Map<String, double> categoryValues = {};
        for (var item in inventoryModel.inventoryItems) {
          categoryValues[item.category] =
              (categoryValues[item.category] ?? 0) + item.quantity;
        }

        List<ChartData> chartData = categoryValues.entries
            .map((entry) => ChartData(entry.key, entry.value))
            .toList();


        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              height: MediaQuery.sizeOf(context).height,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GeneralTopNavLabel(label: 'Inventory', iconName: 'boxes-gray.png'),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Total Inventory Value",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF579008),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        "₱ ${totalValue.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF579008),
                        ),
                        maxLines: 1,
                      ),
                    ),

                    const SizedBox(height: 20),
                    // Pie Chart
                    SizedBox(
                      height: 400,
                      child: SfCircularChart(
                        palette: [
                          Color(0x11579008),
                          Color(0x22579008),
                          Color(0x33579008),
                          Color(0x44579008),
                        ],
                        title:
                            ChartTitle(text: 'Percentage of Inventory',
                              textStyle: TextStyle (
                                fontSize:  16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF787878),
                              ),
                            ),

                        legend:  Legend(
                            isVisible: true,
                            position: LegendPosition.bottom,
                            textStyle: TextStyle(
                              color: Color(0xFF212121),
                              fontSize: 16,
                            )
                        ),

                        series: <CircularSeries>[
                          PieSeries<ChartData, String>(

                              dataSource: _chartData,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              dataLabelSettings:
                                  DataLabelSettings(
                                    isVisible: true,
                                    textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF212121),
                                    )
                                  ),
                          )
                        ],
                      ),
                    ),

                    // Low Inventory Section (Conditional)
                    if (lowInventoryItems.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${lowInventoryItems.length} items ",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)
                            ),
                            TextSpan(
                              text: "have low inventory levels",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              )
                            ),
                          ],
                         ),
                        ),
                     ],
                    SizedBox(height: 30),
                    GeneralTextButton(
                        label: 'Manage Items',
                        color: Color(0xFF579008),
                        backgroundColor: Color(0xFFF1F1F1),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ManageItemsPage(),
                            ),
                          );
                        },
                    ),
                    SizedBox(height: 30),
                  ],
                ),
            )
          ),
          bottomNavigationBar: DashboardBottomNavBar()
        );
      },
    );
  }
}