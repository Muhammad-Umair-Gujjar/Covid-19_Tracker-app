import 'package:flutter/material.dart';
import 'package:flutter_covid_19_tracker/screens/countries_detail_screen.dart';
import 'package:flutter_covid_19_tracker/services/states_services.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                onTap: () => setState(() {}),
                controller: searchContoller,
                decoration: InputDecoration(
                  hintText: "Search with country name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .03),
              _buildCountriesList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountriesList() {
    return Expanded(
      child: FutureBuilder(
        future: StatesServices.countriesListApi(),
        builder: (context, AsyncSnapshot<dynamic> snapShot) {
          if (!snapShot.hasData) {
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade700,
                  highlightColor: Colors.grey.shade100,
                  child: ListTile(
                    title: Container(
                      height: 10,
                      width: 89,
                      color: Colors.white,
                    ),
                    subtitle: Container(
                      height: 10,
                      width: 89,
                      color: Colors.white,
                    ),
                    leading: Container(
                      height: 50,
                      width: 50,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            );
          } else {
            return ListView.builder(
              itemCount: snapShot.data.length,
              itemBuilder: (context, index) {
                String name = snapShot.data[index]['country'];
                if (searchContoller.text.isEmpty) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountriesDetailScreen(
                            name: snapShot.data[index]['country'],
                            cases: snapShot.data[index]['cases'].toString(),
                            flag: snapShot.data![index]['countryInfo']['flag']
                                .toString(),
                            deaths: snapShot.data[index]['deaths'].toString(),
                            recovered: snapShot.data[index]['recovered'].toString(),
                            critical: snapShot.data[index]['critical'].toString(),
                            active: snapShot.data[index]['active'].toString(),
                            todayRecovered: snapShot.data[index]['todayRecovered'].toString(),
                            todayDeaths: snapShot.data[index]['todayRecovered'].toString(),
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(snapShot.data[index]['country']),
                      subtitle: Text(snapShot.data[index]['cases'].toString()),
                      leading: Image(
                        height: 50,
                        width: 50,
                        image: NetworkImage(
                          snapShot.data![index]['countryInfo']['flag'],
                        ),
                      ),
                    ),
                  );
                } else if (name.toLowerCase().contains(
                  searchContoller.text.toLowerCase(),
                )) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountriesDetailScreen(
                            name: snapShot.data[index]['country'],
                            cases: snapShot.data[index]['cases'].toString(),
                            flag: snapShot.data![index]['countryInfo']['flag']
                                .toString(),
                            deaths: snapShot.data[index]['deaths'].toString(),
                            recovered: snapShot.data[index]['recovered'].toString(),
                            critical: snapShot.data[index]['critical'].toString(),
                            active: snapShot.data[index]['active'].toString(),
                            todayRecovered: snapShot.data[index]['todayRecovered'].toString(),
                            todayDeaths: snapShot.data[index]['todayDeaths'].toString(),
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text(snapShot.data[index]['country']),
                      subtitle: Text(snapShot.data[index]['cases'].toString()),
                      leading: Image(
                        height: 50,
                        width: 50,
                        image: NetworkImage(
                          snapShot.data![index]['countryInfo']['flag'],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            );
          }
        },
      ),
    );
  }
}
