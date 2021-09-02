import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SavePercentage extends StatefulWidget {
  final int? currentAmount;
  final int? saveAmount;
  final Color color;

  SavePercentage(
      {required this.currentAmount,
      required this.saveAmount,
      required this.color});

  @override
  _SavePercentageState createState() => _SavePercentageState();
}

class _SavePercentageState extends State<SavePercentage> {
  var percent = 1.0;
  var showPercent = 100;
  initState() {
    calculatePercent();
    super.initState();
  }

  calculatePercent() {
    percent =
        ((widget.currentAmount!.toInt() / widget.saveAmount!.toInt()) * 100) /
            100;
    setState(() {});
    return percent;
  }

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      clipLinearGradient: true,
      animation: true,
      lineHeight: 11.0,
      animationDuration: 2500,
      percent: calculatePercent(),
      center: Text(
        (percent * 100).toString() + '%',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 10),
      ),
      linearStrokeCap: LinearStrokeCap.butt,
      progressColor: widget.color,
    );
  }
}
