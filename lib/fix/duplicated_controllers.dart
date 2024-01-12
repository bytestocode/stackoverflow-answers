import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// https://stackoverflow.com/questions/77805011/pagecontrollers-jumptopage-does-not-work-properly-when-pageview-is-used-as-chil/77806028#77806028
class TableTab extends StatefulWidget {
  const TableTab({super.key});

  @override
  State<TableTab> createState() => _TableTabState();
}

class _TableTabState extends State<TableTab> {
  final List<PageController> pageViewControllers = [];

  @override
  void dispose() {
    for (final controller in pageViewControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void setViewIndex({
    required int tabIndex,
    required int viewIndex,
  }) {
    pageViewControllers[tabIndex].jumpToPage(viewIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TreeModel>(
      builder: (context, treeModel, child) => DefaultTabController(
        length: treeModel.tables.length,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: treeModel.tables
                      .map((table) => Tab(
                            height: 24,
                            child: Text('${table.title}(${table.count})'),
                          ))
                      .toList(),
                  onTap: (index) {
                    /// Switch tab page
                    Provider.of<TreeModel>(context, listen: false)
                        .selectTable(index);

                    /// Jump to the page specified by PageController
                    if (pageViewControllers[index].hasClients) {
                      setViewIndex(
                        tabIndex: index,
                        viewIndex: treeModel.tables[index].viewIndex,
                      );
                    }
                  },
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: treeModel.tables.mapIndexed((index, table) {
                  final pageViewController = PageController(initialPage: 0);
                  pageViewControllers.add(pageViewController);
                  return ChangeNotifierProvider.value(
                    value: table,
                    child: PageView(
                      controller: pageViewController,
                      children: const [],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TreeModel {
  const TreeModel({
    required this.tables,
  });

  final List<TableData> tables;

  void selectTable(int index) {}
}

class TableData extends ChangeNotifier {
  int viewIndex = 0;
  String title = '';
  int count = 0;
}
