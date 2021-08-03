import 'package:flutter/material.dart';

class WeekPreview extends StatefulWidget {
  const WeekPreview({Key? key}) : super(key: key);

  @override
  _WeekPreviewState createState() => _WeekPreviewState();
}

class _WeekPreviewState extends State<WeekPreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      height: 92,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(8, 16, 16, 16),
        child: Row(
          children: List<Widget>.generate(7, (index) {
            return Expanded(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    [
                      Colors.grey,
                      Colors.green,
                      Colors.orange,
                      Colors.green,
                      Colors.red,
                      Colors.red,
                      Colors.orange
                    ][index],
                    BlendMode.srcIn),
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).accentColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                      padding: EdgeInsets.only(top: 8, bottom: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              ["16", "17", "18", "19", "20", "21", "22"][index],
                              style: Theme.of(context).textTheme.headline4),
                          Text(
                              ["Mo", "Di", "Mi", "Do", "Fr", "Sa", "So"][index])
                        ],
                      )),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
