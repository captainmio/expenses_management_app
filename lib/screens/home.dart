import 'package:expenses_management_app/models/widgets/pie_chart_model.dart';
import 'package:expenses_management_app/widgets/app_bar.dart';
import 'package:expenses_management_app/widgets/chart_piechart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/theme_color.dart';
import '../widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Home", actions: [
        IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
      ]),
      body: SingleChildScrollView(
        child: bodyContent(),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget bodyContent() {
    final List<PieChartModel> obj = [
      PieChartModel(
        value: 40,
        label: "Expenses",
        color: Colors.purple,
      ),
      PieChartModel(
        value: 30,
        label: "Income",
        color: Colors.lightBlue,
      ),
      PieChartModel(
        value: 30,
        label: "Saving",
        color: Colors.pink,
      )
    ];

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3))
                ]),
            padding: const EdgeInsets.all(15),
            child: AspectRatio(
              aspectRatio: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Your Balance",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: fontColor),
                          ),
                          Text(
                            "\$867.21",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: fontColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ChartPieChart(
                            objects: obj,
                          ),
                        ),
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
}
