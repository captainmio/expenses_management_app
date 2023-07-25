import 'package:expenses_management_app/models/widgets/pie_chart_model.dart';
import 'package:expenses_management_app/screens/category.dart';
import 'package:expenses_management_app/widgets/app_bar.dart';
import 'package:expenses_management_app/widgets/chart_piechart.dart';
import 'package:expenses_management_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import '../constants/theme_color.dart';
import '../widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Home", actions: [
        IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoryScreen()),
              );
            }),
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
      )
    ];

    final List<Widget> transactions = List.generate(
      20,
      (index) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: paleGreen,
          ),
          child: TransactionItem(
            title: 'Grocery ${index + 1}',
            amount: index * 10.0,
            icon: const Icon(Icons.grade_sharp),
            description: 'Description ${index + 1}',
          ),
        ),
      ),
    );

    Widget detailTile({
      required Icon icon,
      required String name,
      required double value,
    }) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green[300],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              icon,
              Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    '\$ $value',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Available Balance",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: fontColor),
                            ),
                            Text(
                              "\$ 867.21",
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
                          child: ChartPieChart(
                            objects: obj,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  detailTile(
                    name: 'Income',
                    value: 500.0,
                    icon: const Icon(Icons.outbox, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  detailTile(
                    name: 'Expenses',
                    value: 200.0,
                    icon: const Icon(Icons.inbox, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Recent transactions (last 20)",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        debugPrint('Redirect to history screen');
                        // Navigator.pushNamed(context, routeName);
                      },
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationThickness: 2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ...transactions
            ],
          ),
        )
      ],
    );
  }
}
