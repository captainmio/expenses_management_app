import 'package:flutter/material.dart';

class ListIconTabPage extends StatefulWidget {
  final List data;
  final int displayNumber;
  final Function(IconData) onItemSelected;
  final bool? fillOnSelect;
  final double height;
  final double spacing;
  const ListIconTabPage(
      {super.key,
      required this.data,
      required this.displayNumber,
      required this.onItemSelected,
      this.fillOnSelect = false,
      this.height = 280,
      this.spacing = 8.0});

  @override
  State<ListIconTabPage> createState() => _ListIconTabPageState();
}

class _ListIconTabPageState extends State<ListIconTabPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final int _index = 0;
  @override
  void initState() {
    super.initState();

    tabController = TabController(
        length: (widget.data.length / widget.displayNumber).ceil(),
        initialIndex: _index,
        vsync: this);
  }

  IconData? selectedIcon;
  bool isIconSelected(IconData icon) {
    // You can customize the logic here based on your requirements.
    // For this example, I'm checking if the icon is the same as the selected icon.
    return icon == selectedIcon;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          height: widget.height,
          child: TabBarView(
            controller: tabController,
            children: [
              for (int i = 0;
                  i < (widget.data.length / widget.displayNumber).ceil();
                  i++)
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: widget.spacing,
                    crossAxisSpacing: widget.spacing,
                  ),
                  itemCount:
                      (i + 1) * widget.displayNumber <= widget.data.length
                          ? widget.displayNumber
                          : widget.data.length % widget.displayNumber,
                  itemBuilder: (context, index) {
                    IconData item =
                        widget.data[i * widget.displayNumber + index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIcon = item;
                        });
                        widget.onItemSelected(item);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isIconSelected(item) ? Colors.green : null,
                        ),
                        child: Icon(
                          item,
                          color: isIconSelected(item)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          child: TabPageSelector(
            color: Colors.black38,
            controller: tabController,
          ),
        ),
      ],
    );
  }
}
