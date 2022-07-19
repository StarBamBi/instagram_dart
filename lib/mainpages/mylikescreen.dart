/* MyLike List */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyLikeScreen extends StatefulWidget {
  const MyLikeScreen({Key? key}) : super(key: key);

  @override
  _MyLikeScreenState createState() => _MyLikeScreenState();
}

class _MyLikeScreenState extends State<MyLikeScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Test').snapshots(),
          builder: (context,snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, int index) {
                  return Text(snapshot.data?.docs[index]['stack'][index], style: TextStyle(color: Colors.white),);
                  },
              );
            }
          }),
    );
  }
}