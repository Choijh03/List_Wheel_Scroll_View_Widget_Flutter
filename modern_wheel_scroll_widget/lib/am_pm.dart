import 'package:flutter/material.dart';

class AmPm extends StatelessWidget {
  final bool isItAm;

  AmPm({
    super.key,
    required this.isItAm,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            isItAm == true ? 'Am' : 'Pm',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
