import 'package:YourTunesWorld/pages/friend_detail_page.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize:
                const Size.fromHeight(120.0), // Adjust the preferred size
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                const TabBar(
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.list, color: Colors.black),
                          SizedBox(width: 8),
                          Text(
                            'List',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.pin_drop, color: Colors.black),
                          SizedBox(width: 8),
                          Text(
                            'Map',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.filter_alt_rounded, color: Colors.black),
                          SizedBox(width: 8),
                          Text(
                            'Filter',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            SearchListTab(),
            SearchMapTab(),
            SearchFilterTab(),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class SearchListTab extends StatelessWidget {
  const SearchListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for the list
    final List<Map<String, dynamic>> peopleList = [
      {'name': 'Megan Clark', 'profilePicture': 'assets/images/person1.jpg'},
      {'name': 'Erik Martin', 'profilePicture': 'assets/images/person2.jpg'},
      {'name': 'Katie Smith', 'profilePicture': 'assets/images/person3.jpg'},
      // Add more people as needed
    ];

    return ListView.builder(
      itemCount: peopleList.length,
      itemBuilder: (BuildContext context, int index) {
        final String personName = peopleList[index]['name'];
        final String profilePicture = peopleList[index]['profilePicture'];

        return Column(
          children: [
            if (index == 0)
              const SizedBox(height: 20.0), // Add space before the first item
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
              leading: CircleAvatar(
                backgroundImage: AssetImage(profilePicture),
                radius: 30.0,
              ),
              title: Text(personName),
              trailing: ElevatedButton(
                onPressed: () {
                  if (personName == 'Megan Clark') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FriendPage(),
                      ),
                    );
                  }
                  // Handle visit button click
                  print('Visit $personName');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                child: const Text('Visit'),
              ),
            ),
            const SizedBox(height: 16.0), // Add space between list items
          ],
        );
      },
    );
  }
}

class SearchMapTab extends StatelessWidget {
  const SearchMapTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement the content for the 'Map' tab
    return Center(
      child: Image.asset('assets/images/map.jpg'),
    );
  }
}

class SearchFilterTab extends StatefulWidget {
  const SearchFilterTab({Key? key}) : super(key: key);

  @override
  _SearchFilterTabState createState() => _SearchFilterTabState();
}

class _SearchFilterTabState extends State<SearchFilterTab> {
  String? selectedGender;
  String? selectedLocation;
  RangeValues ageRange = const RangeValues(0, 99);

  @override
  void initState() {
    super.initState();
    // Set default values
    selectedGender = 'Both';
    selectedLocation = 'Global';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Tab Content'),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Gender:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child:
                      _buildFilterButton('Male', selectedGender == 'Male', () {
                    setState(() {
                      selectedGender = 'Male';
                    });
                  }),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: _buildFilterButton(
                      'Female', selectedGender == 'Female', () {
                    setState(() {
                      selectedGender = 'Female';
                    });
                  }),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child:
                      _buildFilterButton('Both', selectedGender == 'Both', () {
                    setState(() {
                      selectedGender = 'Both';
                    });
                  }),
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            const Text(
              'Select Location:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Expanded(
                  child: _buildFilterButton(
                      'Local', selectedLocation == 'Local', () {
                    setState(() {
                      selectedLocation = 'Local';
                    });
                  }),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: _buildFilterButton(
                      'Global', selectedLocation == 'Global', () {
                    setState(() {
                      selectedLocation = 'Global';
                    });
                  }),
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            const Text(
              'Select Age Range:',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            RangeSlider(
              values: ageRange,
              onChanged: (newRange) {
                setState(() {
                  ageRange = newRange;
                });
              },
              min: 0,
              max: 99,
              divisions: 99,
              labels: RangeLabels(
                ageRange.start.round().toString(),
                ageRange.end.round().toString(),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('0'),
                Text('99+'),
              ],
            ),
            const SizedBox(height: 30.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Apply the selected filters for the entire search page
                  print(
                      'Applied filters - Gender: $selectedGender, Location: $selectedLocation, Age Range: ${ageRange.start}-${ageRange.end}');
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  side: MaterialStateProperty.all(
                      const BorderSide(color: Colors.grey)),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text('Apply'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String text, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildFilterButton(
    String text, bool isSelected, VoidCallback onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0.0),
      backgroundColor:
          MaterialStateProperty.all(isSelected ? Colors.blue : Colors.white),
      foregroundColor:
          MaterialStateProperty.all(isSelected ? Colors.white : Colors.black),
      side: MaterialStateProperty.all(const BorderSide(color: Colors.grey)),
    ),
    child: Text(text),
  );
}
