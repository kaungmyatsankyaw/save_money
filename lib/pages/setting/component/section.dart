import 'package:flutter/material.dart';

class Section extends StatefulWidget {
  final String title;
  final List<Widget> wlist;

  Section({required this.title, required this.wlist});

  @override
  _SectionState createState() => _SectionState();
}

class _SectionState extends State<Section> {
  List<Widget> widgetList = [];

  @override
  void initState() {
    super.initState();

    var sectionTitle = SectionTitle(
      title: widget.title,
    );
    widgetList.add(sectionTitle);
    widgetList.add(
      Divider(
        height: 2,
        thickness: 1.2,
      ),
    );

    widgetList.addAll(widget.wlist);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(width: 2, color: Colors.blueGrey))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widgetList),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ));
  }
}
