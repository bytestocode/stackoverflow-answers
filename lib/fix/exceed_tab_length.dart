import 'package:flutter/material.dart';

// https://stackoverflow.com/questions/77886536/changing-tabs-programmatically-and-listening-for-tab-change-event-in-flutter/77886589#77886589
class ExceedTabLength extends StatefulWidget {
  const ExceedTabLength({super.key});

  @override
  State<ExceedTabLength> createState() => _ExceedTabLengthState();
}

class _ExceedTabLengthState extends State<ExceedTabLength>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 5, vsync: this);

    //listener adding...
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          // * Check if the index is last then animate to first
          if (_selectedIndex == 4) {
            _controller.animateTo(_selectedIndex = 0);
          } else {
            _controller.animateTo(_selectedIndex += 1);
          }
        }),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: const Text('WELCOME'),
                  floating: true,
                  pinned: true,
                  bottom: TabBar(controller: _controller, tabs: const [
                    Tab(child: Text('Flight')),
                    Tab(child: Text('Train')),
                    Tab(child: Text('Car')),
                    Tab(child: Text('Cycle')),
                    Tab(child: Text('Boat')),
                  ]),
                )
              ];
            },
            body: TabBarView(controller: _controller, children: const [
              Icon(Icons.flight, size: 350),
              Icon(Icons.directions_transit, size: 350),
              Icon(Icons.directions_car, size: 350),
              Icon(Icons.directions_bike, size: 350),
              Icon(Icons.directions_boat, size: 350),
            ])),
      ),
    );
  }
}
