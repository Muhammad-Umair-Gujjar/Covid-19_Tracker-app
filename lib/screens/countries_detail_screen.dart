import 'package:flutter/material.dart';

import '../widgets/reusable_stat_card.dart';

 class CountriesDetailScreen extends StatelessWidget {
  final String name;
  final String cases;
  final String flag;
  final String deaths;
  final String recovered;
  final String critical;
  final String active;
  final String todayDeaths;
  final String todayRecovered;

 const CountriesDetailScreen({
    super.key,
    required this.name,
    required this.cases,
    required this.flag,
    required this.deaths,
    required this.recovered,
    required this.critical,
    required this.active,
    required this.todayRecovered,
    required this.todayDeaths,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ReusableStatCard(stats: [
                    {'title': "Total", 'value': cases},
                    {'title': "Deaths", 'value': deaths},
                    {'title': "Recovered", 'value': recovered},
                    {'title': "Active", 'value': active},
                    {'title': "Critical", 'value': critical},
                    {'title': "Today Deaths", 'value': todayDeaths},
                    {'title': "Today Recovered", 'value': todayRecovered}
                  ]),
                  CircleAvatar(
                    radius: 40,
                      backgroundImage: NetworkImage('${flag}')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
