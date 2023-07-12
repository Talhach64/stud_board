import 'package:flutter/material.dart';

class Img extends StatelessWidget {
  const Img({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(height: 200,
      width: 200,
      image: AssetImage("images/nfc_logoo.png"),

    );
  }
}
