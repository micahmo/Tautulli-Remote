import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/helpers/time_helper.dart';

class TimeTotal extends StatefulWidget {
  final Duration viewOffset;
  final Duration duration;
  final bool isPlaying;

  const TimeTotal({
    super.key,
    required this.viewOffset,
    required this.duration,
    required this.isPlaying,
  });

  @override
  State<TimeTotal> createState() => _TimeTotalState();
}

class _TimeTotalState extends State<TimeTotal> {
  late Timer _timer;
  final Stopwatch _stopwatch = Stopwatch();

  Duration get _calculatedViewOffset => widget.viewOffset + (widget.isPlaying ? _stopwatch.elapsed : Duration.zero);

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(milliseconds: 250), (timer) {
      // Force rebuild twice per second. No need to set anything because the _calculatedViewOffset property is calculated when evaluated.
      setState(() {});
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant TimeTotal oldWidget) {
    super.didUpdateWidget(oldWidget);

    // When the elapsed time gets updated externally (due to a server refresh), reset the stopwatch
    if (widget.viewOffset != oldWidget.viewOffset) {
      _stopwatch
        ..reset()
        ..start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${TimeHelper.hourMinSec(_calculatedViewOffset)}/${TimeHelper.hourMinSec(widget.duration)}',
      style: const TextStyle(
        fontSize: 13,
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _stopwatch.stop();
    super.dispose();
  }
}
