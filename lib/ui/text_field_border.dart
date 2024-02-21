import 'package:flutter/material.dart';

// "I can't see the color of flutter's borer's color TextField()"
// - https://stackoverflow.com/questions/78031672/i-cant-see-the-color-of-flutters-borers-color-textfield
class TextFieldBorder extends StatelessWidget {
  const TextFieldBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextField(
          enabled: true,
          decoration: InputDecoration(
            hintText: "영화 제목을 검색해주세요.",
            helperText: 'helper',
            labelText: 'label',
            counterText: 'counter',
            // border 프로퍼티는 모양만 변경할 수 있고, 색상은 변경할 수 없다.
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              // borderSide: BorderSide(
              //   color: Colors.red,
              // ),
            ),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(
            //     color: Colors.blue,
            //   ),
            // ),
            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(
            //     color: Colors.green,
            //   ),
            // ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
