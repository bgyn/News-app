import 'package:flutter/material.dart';
import 'package:news_app/states/service/countries_service.dart';
import 'package:news_app/views/component/button.dart';
import 'package:news_app/views/profile/user_profile.dart';

class CountriesViews extends StatefulWidget {
  const CountriesViews({super.key});

  @override
  State<CountriesViews> createState() => _CountriesViewsState();
}

class _CountriesViewsState extends State<CountriesViews> {
  final List countries = [];

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Select your country"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade800,
                label: const Text('Search'),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                suffixIcon: const Icon(Icons.search),
              ),
            ),
            FutureBuilder(
              future: getCountries(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    snapshot.data!.forEach((k, _) => countries.add(k));
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: countries.length,
                        itemBuilder: (BuildContext context, int index) {
                          var code = countries[index];
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                    "${snapshot.data![code.toString()]['name']}"),
                                leading: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.network(
                                      "${snapshot.data![code.toString()]['flag']['small']}"),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UserProfile()));
          },
          child: const ButtonWidget(text: 'Next'),
        ),
      ),
    );
  }
}
