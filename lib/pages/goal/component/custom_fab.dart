import 'package:app/constant/valuse.dart';
import 'package:app/pages/goal/component/add_history.dart';
import 'package:app/providers/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CustomFabDetail extends StatelessWidget {
  final int saveId;
  CustomFabDetail({required this.saveId});
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
  final _formKey = GlobalKey<FormState>();

  Future<dynamic> saveHistory(BuildContext context,
      {required formKey, required saveId}) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddSaveHistroy(
            saveId: saveId,
          );
        });
  }

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
        buildSpeedDialChild(FontAwesomeIcons.plus, 'Save Money',
            StringValues.addIncomeRoute, Colors.blue,
            type: 'save', context: context),
        buildSpeedDialChild(FontAwesomeIcons.trash, 'Delete Goal',
            StringValues.addOutcomeRoute, Colors.deepOrange,
            type: 'delete', context: context),
      ],
    );
  }

  SpeedDialChild buildSpeedDialChild(
      IconData iconData, String label, String routeName, Color color,
      {required type, required BuildContext context}) {
    return SpeedDialChild(
      child: FaIcon(
        iconData,
        size: 14,
      ),
      backgroundColor: color,
      foregroundColor: Colors.white,
      label: label,
      onTap: () async {
        switch (type) {
          case 'save':
            await saveHistory(context, formKey: _formKey, saveId: saveId);
            break;
          case 'delete':
            await Provider.of<GoalProvider>(context, listen: false)
                .deleteGoal(id: saveId);
            print(saveId);
            break;
          default:
        }
      },
    );
  }
}
