import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {

  // FireBase DB
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String postTitle = "";
  String content = "";
  String dataTest = "";

  String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posting")),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '포스팅 제목',
              ),
              onChanged: (value) {
                setState(() {
                  postTitle = value;
                });
              },
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '내용',
              ),
              maxLines: 10,
              onChanged: (value) {
                setState(() {
                  content = value;
                });
              },
            ),
            const SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              String postKey = getRandomString(16);

              firestore.collection('Posts').doc(postKey).set({
                "key":postKey,
                "title":postTitle,
                "explain":content,
                "firstPicUrl":"",
                "firstPicWidth":0,
                "firstPicHeight":0,
                "authorName":"huni",
                "like":0,
              });
            }, child: Text('업로드 하기')),
            ElevatedButton(onPressed: () async{
              DocumentSnapshot data = await firestore.collection('Posts').doc('15v2hPtduKu525P8').get();
              print(data['authorName']);
              dataTest = data.toString();
              }, child: Text('데이터 불러오기')),
          ],
        ),
      ),
    );
  }
}