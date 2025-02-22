import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountryListScreen(),
    );
  }
}

class CountryListScreen extends StatelessWidget {
  final List<CountrySection> countrySections = [
    CountrySection('Americas', [
      Country('United States', '🇺🇸'),
      Country('Canada', '🇨🇦'),
      Country('Mexico', '🇲🇽'),
      Country('Brazil', '🇧🇷'),
    ]),
    CountrySection('Europe', [
      Country('United Kingdom', '🇬🇧'),
      Country('Germany', '🇩🇪'),
      Country('France', '🇫🇷'),
      Country('Spain', '🇪🇸'),
      Country('Italy', '🇮🇹'),
      Country('Turkey', '🇹🇷'),
      Country('Netherlands', '🇳🇱'),
      Country('Sweden', '🇸🇪'),
      Country('Poland', '🇵🇱'),
      Country('Belgium', '🇧🇪'),
    ]),
    CountrySection('Asia-Pacific', [
      Country('Japan', '🇯🇵'),
      Country('India', '🇮🇳'),
      Country('Australia', '🇦🇺'),
      Country('Singapore', '🇸🇬'),
    ]),
    CountrySection('Middle East and North Africa', [
      Country('UAE', '🇦🇪'),
      Country('Saudi Arabia', '🇸🇦'),
      Country('Egypt', '🇪🇬'),
    ]),
    CountrySection('Sub-Saharan Africa', [
      Country('South Africa', '🇿🇦'),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Country'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
        itemCount: countrySections.length,
        itemBuilder: (context, sectionIndex) {
          final section = countrySections[sectionIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.grey.shade200,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Text(
                  section.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: section.countries.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, countryIndex) {
                  final country = section.countries[countryIndex];
                  return ListTile(
                    leading: Text(
                      country.flag,
                      style: TextStyle(fontSize: 24),
                    ),
                    title: Text(country.name),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Selected: ${country.name}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class CountrySection {
  final String name;
  final List<Country> countries;

  CountrySection(this.name, this.countries);
}

class Country {
  final String name;
  final String flag;

  Country(this.name, this.flag);
}
