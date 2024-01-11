import 'package:flutter/material.dart';

class TabBarExample extends StatefulWidget{
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();

}
class _TabBarExampleState extends State<TabBarExample>
    with TickerProviderStateMixin {
  List<String> student = [
    'Nguyen Van A',
    'Nguyen Van B',
    'Nguyen Van C',
    'Nguyen Van D',
    'Nguyen Van A',
    'Nguyen Van B',
    'Nguyen Van C',
    'Nguyen Van D',
    'Nguyen Van A',
    'Nguyen Van B',
    'Nguyen Van C',
    'Nguyen Van D',
    'Nguyen Van E'
  ];
  List<String> placesImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpR_wLhLo6S48krNSpJxCG4uthiNxlCmeVwA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpR_wLhLo6S48krNSpJxCG4uthiNxlCmeVwA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpR_wLhLo6S48krNSpJxCG4uthiNxlCmeVwA&usqp=CAU',
    // Add more image paths as needed
  ];
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.red,
              ),
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        text: "Places",
                      ),
                      Tab(
                        text: "Inspiration",
                      ),
                      Tab(
                        text: "Emotion",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 250,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: placesImages.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.network(
                                placesImages[index],
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 8),
                              Text("Place ${index + 1}"),
                            ],
                          ),
                        );
                      },
                    ),
                    Text(" this is tabbar for inspiration"),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: student.length,
                        itemBuilder: (BuildContext context, index) {
                          return Text(student[index]);
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}