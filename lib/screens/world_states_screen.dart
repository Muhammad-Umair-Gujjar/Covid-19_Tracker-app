import 'package:flutter/material.dart';
import 'package:flutter_covid_19_tracker/models/world_states_model.dart';
import 'package:flutter_covid_19_tracker/screens/countries_list_screen.dart';
import 'package:flutter_covid_19_tracker/widgets/reusable_stat_card.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import '../services/states_services.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldstatesScreenState();
}

class _WorldstatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 3),
    vsync: this,
  )..repeat();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.02,),
          child: FutureBuilder(
            future: StatesServices.fetchWorldStatesRecord(),
            builder: (context, AsyncSnapshot<WorldStatesModel> snapShot) {
              if (!snapShot.hasData) {
                return Center(
                      child: SpinKitFadingCircle(
                        controller: _controller,
                        color: Colors.white,
                        size: 50,
                      ),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                      PieChart(
                        dataMap: {
                          'Total': double.parse(snapShot.data!.cases.toString()),
                          'Recovered': double.parse(snapShot.data!.recovered.toString()),
                          'Death': double.parse(snapShot.data!.deaths.toString()),
                        },
                        chartValuesOptions: ChartValuesOptions(
                          showChartValuesInPercentage: true,
                          // showChartValuesOutside: true,
                        ),
                        legendOptions: LegendOptions(
                          legendPosition: LegendPosition.left,
                        ),
                        chartRadius: MediaQuery.of(context).size.width/3.0,
                        chartType: ChartType.ring,
                          ringStrokeWidth: 15,
                        animationDuration: Duration(milliseconds: 1200),
                        colorList: colorList,
                      ),
                      ReusableStatCard(stats: [
                        {'title': "Total", 'value': snapShot.data!.cases.toString()},
                        {'title': "Deaths", 'value': snapShot.data!.deaths.toString()},
                        {'title': "Recovered", 'value': snapShot.data!.recovered.toString()},
                        {'title': "Active", 'value': snapShot.data!.active.toString()},
                        {'title': "Critical", 'value': snapShot.data!.critical.toString()},
                        {'title': "Today Deaths", 'value': snapShot.data!.todayDeaths.toString()},
                        {'title': "Today Recovered", 'value': snapShot.data!.todayRecovered.toString()}
                      ]),
                      SizedBox(height: MediaQuery.of(context).size.width * 0.05,),
                      _actionButton(),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
  Widget _actionButton(){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>CountriesListScreen()));
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Color(0xff1aa260),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text("Track Countries")),
      ),
    );
  }
}

