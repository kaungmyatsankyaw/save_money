import 'package:app/constant/valuse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomFab extends StatelessWidget {
  final renderOverlay = true;
  final visible = true;
  final switchLabelPosition = false;
  final extend = false;
  final rmicons = false;
  final customDialRoot = false;
  final closeManually = false;
  final useRAnimation = true;
  final isDialOpen = ValueNotifier<bool>(false);
  final speedDialDirection = SpeedDialDirection.Up;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      backgroundColor: Colors.blueGrey,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      openCloseDial: isDialOpen,
      childPadding: EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      dialRoot: customDialRoot
          ? (ctx, open, toggleChildren) {
              return ElevatedButton(
                onPressed: toggleChildren,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[200],
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                ),
                child: Text(
                  "Custom Dial Root",
                  style: TextStyle(fontSize: 17),
                ),
              );
            }
          : null,
      buttonSize: 56,
      // it's the SpeedDial size which defaults to 56 itself
      childrenButtonSize: 56.0,
      visible: visible,
      direction: speedDialDirection,
      switchLabelPosition: switchLabelPosition,
      closeManually: closeManually,
      renderOverlay: renderOverlay,
      useRotationAnimation: useRAnimation,
      tooltip: 'Open Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      elevation: 2,
      isOpenOnStart: false,
      animationSpeed: 200,
      shape: customDialRoot ? RoundedRectangleBorder() : StadiumBorder(),
      children: [
        buildSpeedDialChild(
            FontAwesomeIcons.arrowAltCircleLeft,
            StringValues.incomeAddTitle,
            StringValues.addIncomeRoute,
            Colors.blue),
        buildSpeedDialChild(
            FontAwesomeIcons.arrowAltCircleRight,
            StringValues.outcomeAddTitle,
            StringValues.addOutcomeRoute,
            Colors.deepOrange),
      ],
    );
  }

  SpeedDialChild buildSpeedDialChild(
      IconData iconData, String label, String routeName, Color color) {
  
    return SpeedDialChild(
      child: FaIcon(iconData),
      backgroundColor: color,
      foregroundColor: Colors.white,
      label: label,
      onTap: () => goToRoute(routeName),
    );
  }

  void goToRoute(String routeName) {
    Get.toNamed(routeName);
  }
}
