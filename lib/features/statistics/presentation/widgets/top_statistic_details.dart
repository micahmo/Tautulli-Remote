import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/time_helper.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../data/models/statistic_data_model.dart';

class TopStatisticDetails extends StatelessWidget {
  final StatisticDataModel statData;

  const TopStatisticDetails({
    super.key,
    required this.statData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          statData.title ?? '',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: LocaleKeys.plays_title.tr(),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: statData.totalPlays.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
        ),
        _duration(),
      ],
    );
  }

  Widget _duration() {
    Map<String, int> durationMap = TimeHelper.durationMap(
      statData.totalDuration ?? const Duration(seconds: 0),
    );

    return RichText(
      text: TextSpan(
        children: [
          if (durationMap['day']! > 1 || durationMap['hour']! > 1 || durationMap['min']! > 1 || durationMap['sec']! > 1)
            TextSpan(
              text: '${LocaleKeys.time_title.tr()} ',
            ),
          if (durationMap['day']! > 0)
            TextSpan(
              children: [
                TextSpan(
                  text: durationMap['day'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    color: Colors.grey[200],
                  ),
                ),
                TextSpan(
                  text: ' days ',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
          if (durationMap['hour']! > 0)
            TextSpan(
              children: [
                TextSpan(
                  text: durationMap['hour'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    color: Colors.grey[200],
                  ),
                ),
                TextSpan(
                  text: ' hrs ',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
          if (durationMap['min']! > 0)
            TextSpan(
              children: [
                TextSpan(
                  text: durationMap['min'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    color: Colors.grey[200],
                  ),
                ),
                TextSpan(
                  text: ' mins',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
          if (durationMap['day']! < 1 && durationMap['hour']! < 1 && durationMap['min']! < 1 && durationMap['sec']! > 0)
            TextSpan(
              children: [
                TextSpan(
                  text: durationMap['sec'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    color: Colors.grey[200],
                  ),
                ),
                TextSpan(
                  text: ' secs',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    color: Colors.grey[200],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
