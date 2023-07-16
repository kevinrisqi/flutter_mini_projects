import 'package:flutter/material.dart';
import 'package:flutter_mini_projects/properties/size.dart';
import 'package:flutter_mini_projects/properties/style.dart';
import 'package:flutter_mini_projects/widgets/custom_text.dart';

class TimelineTilePage extends StatefulWidget {
  const TimelineTilePage({super.key});

  @override
  State<TimelineTilePage> createState() => _TimelineTilePageState();
}

class _TimelineTilePageState extends State<TimelineTilePage> {
  int currentIon = 15000;
  int barSize = 100;
  double barThickness = 8;

  int get maxIon => listLevel.last.maxIon;
  double get progress => currentIon / maxIon;
  double get barWidth => maxIon / barSize;

  List<Level> listLevel = [
    Level(level: 2, maxIon: 10000),
    Level(level: 3, maxIon: 20000),
    Level(level: 4, maxIon: 40000),
    Level(level: 5, maxIon: 70000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customText(
          'Timeline',
          color: Colors.white,
          fontWeight: bold,
          fontSize: FontSize.s18,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Progress $progress"),
            Text("Current Ion $currentIon"),
            Text("Bar Width $barWidth"),
            SizedBox(
              height: 70,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 24),
                      child: SizedBox(
                        width: barWidth,
                        child: LinearProgressIndicator(
                            value: progress, minHeight: barThickness),
                      ),
                    ),
                    Positioned(
                      top: barThickness / 2,
                      left: 0,
                      child: Column(
                        children: [
                          Indicator(isActive: true),
                          Text(
                            "Level 1\n0",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    ...List.generate(
                      listLevel.length,
                      (index) {
                        var level = listLevel[index].level;
                        int maxIon = listLevel[index].maxIon;
                        var pos = maxIon / barSize;
                        return Positioned(
                          top: barThickness / 2,
                          left: pos,
                          child: Column(
                            children: [
                              Indicator(isActive: currentIon >= maxIon),
                              Text(
                                "Level $level\n$maxIon",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Level {
  final int level;
  final int maxIon;

  Level({required this.level, required this.maxIon});
}

class Indicator extends StatelessWidget {
  const Indicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 17,
      height: 17,
      decoration: BoxDecoration(
        color: isActive ? Colors.purple : Colors.white,
        border: Border.all(
            color: isActive ? Colors.white : Colors.purple, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
