/* 홈스크린 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cards/postcard.dart';
import '../pages/createpostpage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ListView.separated(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return PostCard(
              number: index,
                authorName : '하이'
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(height: 10,color: Colors.black,);
          },
        ),
        GestureDetector(
          onTap: (){
            Get.to(CreatePostPage());
          },
          child: Container(
            margin: EdgeInsets.all(15),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: Colors.black,
            ),
            child: Icon(Icons.add, color: Colors.white,),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
            builder: (context,snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              ListView.separated(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return PostCard(
                      number: index,
                      authorName : snapshot.data?.docs[index]['authorName']
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Container(height: 10,color: Colors.black,);
                },
              );
            })
      ],
    );
  }
}