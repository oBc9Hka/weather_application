import 'package:flutter/material.dart';

import 'forecast_tile.dart';

class ForecastDay extends StatelessWidget {
  const ForecastDay({Key? key, required this.dayName, required this.tiles})
      : super(key: key);
  final String dayName;
  final List<ForecastTile> tiles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: Text(
            dayName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
        ),
        if (dayName != 'Today')
          const Divider(
            thickness: 1,
          ),
        ...tiles.map(
          (tile) {
            return Column(
              children: [
                (dayName == 'Today' && tile == tiles.first)
                    ? Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: tile,
                      )
                    : tile,
                if (tile != tiles.last && tile != tiles.first)
                  Divider(
                    indent: MediaQuery.of(context).size.width * 0.25,
                    thickness: 1,
                  ),
                if(tile == tiles.first && dayName != 'Today')
                  Divider(
                    indent: MediaQuery.of(context).size.width * 0.25,
                    thickness: 1,
                  ),
              ],
            );
          },
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
