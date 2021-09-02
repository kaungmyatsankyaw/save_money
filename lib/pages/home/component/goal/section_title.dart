import 'package:app/providers/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Your Goals',
            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
          ),
          Consumer<GoalProvider>(builder: (_, prov, wz) {
            return Row(
                children: prov.filterList
                    .map<Widget>((e) => Container(
                        decoration: BoxDecoration(
                            border: prov.getFilter == e
                                ? Border(
                                    bottom: BorderSide(
                                        width: 3, color: Colors.white60))
                                : null),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                            onTap: () => prov.setFilter(e),
                            child: Text(
                              e,
                              style: prov.getFilter == e
                                  ? TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)
                                  : TextStyle(color: Colors.grey[350]),
                            ))))
                    .toList());
          })
        ],
      ),
    );
  }
}
