import 'package:flutter/material.dart';
import 'package:task1/apicall.dart';
import 'package:task1/model.dart';

class ListViewPost extends StatefulWidget {
  const ListViewPost({super.key});

  @override
  State<ListViewPost> createState() => _ListViewState();
}

class _ListViewState extends State<ListViewPost> {

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
    return Scaffold(
      body:  postModel == null || postModel!.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      ) : ListView.builder(
        itemCount: 4,
          scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 100,
            child: Card(
              color: Colors.black12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(postModel![index].name),
                  Text(postModel![index].title),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
