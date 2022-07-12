import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mainpage.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    Timer(const Duration(seconds:3), (){
      Get.offAll(MainPage());
    }); // Timer
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width, // 디바이스 넓이
              height: MediaQuery.of(context).size.height, // 디바이스 높이
              child: Image.asset('assets/image/cat.webp', fit: BoxFit.contain,)
            /*
          contain : 세로 가로든 부모 크기에 먼저 맞춰진 후-> 맞춰지면 나머지 공백 공백이 있더라도 사진 모두 표시
          fill : 가로, 세로 중에 먼저 맞춰진 것 기준으로 억지로 늘리거나 줄임(비율변화)
          cover : 화면을 꽉차게 함(세로 가로 중 하나가 맞춰지고 나머지는 잘림)
            * */
          ),
          CircularProgressIndicator()
        ],

      ),
    );
  }
}