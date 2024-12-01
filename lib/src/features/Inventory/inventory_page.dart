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
            _chartData = [ChartData("No Inventory yet", 100)];
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
          appBar: AppBar(
            title: LayoutBuilder(
              builder: (context, constraints) {
                double fontSizee = constraints.maxWidth > 400 ? 30 : 20;
                double iconSize = constraints.maxWidth * 0.11; 
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/icons/boxes-gray.png', 
                      height: iconSize,
                      width: iconSize, 
                      fit: BoxFit.contain, 
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Inventory",
                        style: TextStyle(
                          fontSize: fontSizee,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 78, 78, 78),
                        ),
                      ),
                    ],
                  );
              },
            ),
          ),
          body: LayoutBuilder( 
            builder: (context, constraints) {
              return Column(
                children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align( 
                              alignment: const Alignment(-0.7, 0.0),
                              child: Text(
                                "Total Inventory Value",
                                style: TextStyle(
                                  fontSize: constraints.maxWidth > 400 ? 30 : 16,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF579008),
                                ),
                              ),
                            ),
                            
                            Align(
                              alignment: const Alignment(-0.6, 0.0),
                              child: AutoSizeText(
                                "₱ ${totalValue.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF579008),
                                ),
                                maxLines: 1,
                                minFontSize: constraints.minWidth > 400 ? 20 : 50, 
                                maxFontSize: constraints.maxWidth > 400 ? 50 : 50, 
                              ),
                            ),

                            const SizedBox(height: 20),

                                  // Pie Chart
                                  SizedBox(
                                    height: constraints.maxWidth > 400 ? 400 : 250, 
                                    child: SfCircularChart(
                                      title:
                                          ChartTitle(text: 'Percentage of Inventory',                    
                                            textStyle: TextStyle (
                                              fontSize: constraints.maxWidth > 400 ? 20 : 30, 
                                              fontWeight: FontWeight.bold,
                                              color: const Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ),

                                      legend:  Legend(
                                          isVisible: true,
                                          position: LegendPosition.bottom,
                                          textStyle: TextStyle(
                                            fontSize: constraints.maxWidth > 400 ? 20 : 30,
                                          )
                                          ),

                                      series: <CircularSeries>[
                                        PieSeries<ChartData, String>(
                                          
                                            dataSource: chartData,
                                            xValueMapper: (ChartData data, _) => data.x,
                                            yValueMapper: (ChartData data, _) => data.y,
                                            dataLabelSettings:
                                                DataLabelSettings(
                                                  isVisible: true,
                                                  textStyle: TextStyle(
                                                    fontSize: constraints.maxWidth > 400 ? 20 : 30,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color.fromARGB(255, 0, 0, 0),
                                                  )
                                                )
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
                                              fontSize: constraints.maxWidth > 400 ? 20 : 16),
                                          ),
                                          TextSpan(
                                            text: "have low inventory levels",
                                            style: TextStyle(
                                              color: Colors.grey, 
                                              fontWeight: FontWeight.bold,
                                              fontSize: constraints.maxWidth > 400 ? 20 : 16),
                                          ),
                                        ],
                                       ),
                                      ),
                                   ],
                        ],
                      ), 
                    ),
                  ),

                  // Manage Items Button (Always at the bottom)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: constraints.maxWidth > 600 ? 300 : double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ManageItemsPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Manage items",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: constraints.maxWidth > 400 ? 20 : 16,),
                          ),
                        ),
                      ),
                    ),  
                ],
              );
            },
          ),
        );
      },
    );
  }
}