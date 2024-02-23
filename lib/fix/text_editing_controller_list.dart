import 'package:flutter/material.dart';

// "Dynamically Adding and Removing TextFormFields"
// https://stackoverflow.com/questions/78046722/dynamically-adding-and-removing-textformfields/78046975#78046975
class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final List<TextEditingController> controllers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  for (var ctrl in controllers) ...[
                    TextFormField(
                      // * Add a controller to each TextFormField
                      controller: ctrl,
                      decoration: InputDecoration(
                        hintText: 'Todo ${controllers.indexOf(ctrl) + 1}',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(Icons.note_alt),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {});
                              removeTextField(controllers.indexOf(ctrl));
                            },
                            icon: const Icon(Icons.clear)),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],

                  // Add Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.withOpacity(0.2),
                            ),
                            onPressed: () {
                              setState(() {
                                addTextField();
                              });
                            },
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.add_circle),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Add',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void addTextField() {
    controllers.add(TextEditingController());
  }

  void removeTextField(int index) {
    controllers.removeAt(index);
  }
}