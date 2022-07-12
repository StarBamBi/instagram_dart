/* 그리드 뷰로 보기 */

import 'package:flutter/material.dart';

class ShowGirdScreen extends StatefulWidget {
  const ShowGirdScreen({Key? key}) : super(key: key);

  @override
  _ShowGridScreenState createState() => _ShowGridScreenState();
}

class _ShowGridScreenState extends State<ShowGirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("쇼그리드입니다."),
    );
  }
}