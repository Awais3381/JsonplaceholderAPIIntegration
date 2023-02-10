import 'package:flutter/material.dart';
import 'package:task1/apicall.dart';
import 'package:task1/listview.dart';
import 'package:task1/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with TickerProviderStateMixin{

  late List<PostModel>? postModel= [];

  @override
  void initState(){
    super.initState();
    _getData();
  }

  void _getData() async {
    postModel = (await ApiService().getPosts())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final TabController _tabController= TabController(length: 2, vsync: this);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Task 1"),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Planets",
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 75,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "If one of the residents at the planets has the MAMMAL species, the planet will be listed down here.",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "You can change this in the /src/utils/getPlanets.js",
                style: TextStyle(
                    color: Colors.green.shade600,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(borderRadius: BorderRadius.circular(50),
                    color: Colors.black38
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Colors.black45,
                    isScrollable: true,
                    //indicatorColor: Colors.black,
                    //labelPadding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                    tabs: [
                      Tab(
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.black12,
                            width: 1
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("List View"),
                        ),
                      ),
                      ),
                      Tab(
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Colors.black12,
                                width: 1
                            ),
                          ),
                          child: Align(
                            child: Text("Grid View"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: 1000,
                      height: 1050,
                      child: TabBarView(
                          controller: _tabController,
                          children: [
                            //1
                            postModel == null || postModel!.isEmpty ? const Center(child: CircularProgressIndicator(),) : ListView.builder(
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 220,
                                    child: Card(
                                      color: Colors.grey.shade600,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 20),
                                              child: Text("Dec 10, 2014",style: TextStyle(fontSize: 20,color: Colors.orange),),
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.account_circle_rounded,size: 40,color: Colors.orange,),
                                              title:   Text("Name "+postModel![index].name,style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500),) ,
                                              subtitle: Padding(
                                                padding: const EdgeInsets.only(top: 10),
                                                child: Text(postModel![index].title,style: TextStyle(color: Colors.white),),
                                              ),
                                              trailing: Text("Template",style: TextStyle(fontSize: 20,color: Colors.white70),),
                                            ),
                                           // Text("Name "+postModel![index].name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                            //2

                            postModel == null || postModel!.isEmpty
                                ? const Center(
                              child: CircularProgressIndicator(),
                            ) : GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20
                              ),
                              itemCount: 6,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 220,
                                    child: Card(
                                      color: Colors.grey.shade600,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text("   Dec 10, 2014",style: TextStyle(fontSize: 20,color: Colors.orange),),
                                            ListTile(
                                              leading: Icon(Icons.account_circle_rounded,size: 40,color: Colors.orange,),
                                              title:   Text("Name "+postModel![index].name,style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500),) ,
                                              subtitle: Padding(
                                                padding: const EdgeInsets.only(top: 10),
                                                child: Text(postModel![index].title,style: TextStyle(color: Colors.white),),
                                              ),
                                              trailing: Text("Template",style: TextStyle(fontSize: 20,color: Colors.white70),),
                                            ),
                                            // Text("Name "+postModel![index].name,style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                          ]),
                    ),
                  )
                ],
              ),
            ],
          ),
        )));
  }
}

