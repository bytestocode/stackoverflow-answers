import 'package:flutter/material.dart';

// https://stackoverflow.com/questions/78113331/how-to-make-a-popupmenu-with-checkable-checkboxes
class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  _NotesViewState createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  bool _isInputVisible = false;
  TextEditingController _textEditingController = TextEditingController();
  late bool? isChecked;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    isChecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('abc :$isChecked'),
        actions: [
          PopupMenuButton<int>(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.filter_list),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<int>>[
                PopupMenuItem<int>(
                  value: 0,
                  child: StatefulBuilder(builder: (context, innerSetState) {
                    return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 12.0,
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Select Filters',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            CheckboxListTile(
                              title: const Text('Bogenhausen'),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: isChecked,
                              onChanged: (bool? newValue) {
                                innerSetState(() {
                                  isChecked = newValue;
                                });
                                setState(() {
                                  isChecked = newValue;
                                });
                              },
                              activeColor: Colors.greenAccent,
                              checkColor: Colors.black,
                            ),
                          ],
                        ));
                  }),
                ),
              ];
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isInputVisible = !_isInputVisible;
              });
            },
          ),
          Visibility(
            visible: _isInputVisible,
            child: SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    hintText: 'search',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: const SizedBox(),
    );
  }
}
