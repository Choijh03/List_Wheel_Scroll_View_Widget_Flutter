import 'package:flutter/material.dart';
import 'package:modern_wheel_scroll_widget/am_pm.dart';
import 'package:modern_wheel_scroll_widget/hours.dart';
import 'package:modern_wheel_scroll_widget/minutes.dart';
import 'package:modern_wheel_scroll_widget/tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //ways to access items

  //1st way: you can use variable and onselectedItemchanged to access the data
  int currentHour = 0;

  //2nd way: you can use controller to access the data
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //hours wheel
          Container(
            width: 50,
            child: ListWheelScrollView.useDelegate(
              onSelectedItemChanged: (value) {
                //do stuff
                setState(() {
                  currentHour = value;
                });
              },
              //height of the tile
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 13,
                builder: (context, index) {
                  return MyHours(
                    hours: index,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          //minutes wheel
          Container(
            width: 50,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              //height of the tile
              itemExtent: 70,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 60,
                builder: (context, index) {
                  return MyMinutes(
                    mins: index,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          //minutes wheel
          Container(
            width: 80,
            child: ListWheelScrollView.useDelegate(
              //height of the tile
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 2,
                builder: (context, index) {
                  if (index == 0) {
                    return AmPm(
                      isItAm: true,
                    );
                  } else {
                    return AmPm(
                      isItAm: false,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
