import 'package:flutter/material.dart';

class ExpansionTileSample extends StatefulWidget {
  const ExpansionTileSample({super.key});

  @override
  State<ExpansionTileSample> createState() => _ExpansionTileSampleState();
}

class _ExpansionTileSampleState extends State<ExpansionTileSample> {
  late List<ExpansionTileController> tileControllers;

  @override
  void initState() {
    super.initState();
    tileControllers = List.generate(2, (_) => ExpansionTileController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StatefulBuilder(builder: (
        BuildContext context,
        StateSetter setInternalState,
      ) {
        return ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              height: 2,
              color: Colors.grey,
            ),
          ),
          ExpansionTile(
              controller: tileControllers[0],
              onExpansionChanged: (isExpanded) {
                if (tileControllers[1].isExpanded) {
                  tileControllers[1].collapse();
                }
                if (isExpanded) {
                  tileControllers[0].expand();
                } else {
                  tileControllers[0].collapse();
                }
              },
              initiallyExpanded: true,
              maintainState: false,
              shape: Border(),
              title: Text(
                'Описание на продукта',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              children: [
                // htmlView
                Text('htmlView'),
              ]),
          ExpansionTile(
              controller: tileControllers[1],
              onExpansionChanged: (isExpanded) {
                if (tileControllers[0].isExpanded) {
                  tileControllers[0].collapse();
                }
                if (isExpanded) {
                  tileControllers[1].expand();
                } else {
                  tileControllers[1].collapse();
                }
              },
              shape: Border(),
              title: Text(
                'Описание на продукта 2',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              children: [
                Text('12'),
                Text('12'),
                Text('12'),
                Text('12'),
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              height: 2,
              color: Colors.grey,
            ),
          ),
        ]);
      }),
    );
  }
}
