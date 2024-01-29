import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DigitalClock extends StatefulWidget {
  DigitalClock({super.key});

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {

  late Timer? timer;
  String hour1 = "0",
      hour2 = "0",
      minute1 = "0",
      minute2 = "0",
      second1 = "0",
      second2 = "0";
  final df = DateFormat('HH:mm:ss');

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final time = DateTime.now();
      final printable = df.format(time);
      final splits = printable.split(":");
      final hour = splits[0];
      final minute = splits[1];
      final second = splits[2];
      setState(() {
        hour1 = hour.characters.first;
        hour2 = hour.characters.last;
        minute1 = minute.characters.first;
        minute2 = minute.characters.last;
        second1 = second.characters.first;
        second2 = second.characters.last;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Digital Clock'),
      ),
      body: Center(
        child: Center(
          child: Text('$hour1$hour2 : $minute1$minute2 : $second1$second2'),
        ),
      ),
    );
  }
}
