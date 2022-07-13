import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MakePostPage extends StatefulWidget {
  @override
  _MakePostPageState createState() => _MakePostPageState();
}

class _MakePostPageState extends State<MakePostPage> {

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String postTitle = "";
  String content = "";

  // FireBase DB
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("포스트 업로드 테스트")),
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
              decoration: InputDecoration(
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
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){

              firestore.collection('Post').doc('apple').delete();
            }, child: Text('업로드 하기')),
          ],
        ),
      ),
    );
  }
}