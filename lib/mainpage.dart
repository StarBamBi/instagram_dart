import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sns_test/mainpages/homescreen.dart';
import 'package:sns_test/mainpages/mylikescreen.dart';
import 'package:sns_test/mainpages/myscreen.dart';
import 'package:sns_test/mainpages/showgridscreen.dart';
import 'package:sns_test/testpage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> bottomItems=[
    const BottomNavigationBarItem(
      label: '1번',
      icon: Icon(Icons.favorite),
    ),
    const BottomNavigationBarItem(
      label: '2번',
      icon: Icon(Icons.search),
    ),
    const BottomNavigationBarItem(
      label: '3번',
      icon: Icon(Icons.live_tv),
    ),
    const BottomNavigationBarItem(
      label: '4번',
      icon: Icon(Icons.person),
    ),
  ];
  List pages=[
    const HomeScreen(),
    const ShowGirdScreen(),
    const MyLikeScreen(),
    const MyScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: GestureDetector(
          onTap: (){
            Get.to(TestPage());
          },
          child: const Text('Instagram', style: TextStyle(fontFamily: 'InstaTitle', fontSize: 25,
            color: Colors.white,),),
        ),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,  // Bar 배경색
        selectedItemColor: Colors.white,  // 선택된 아이템 색상
        unselectedItemColor: Colors.white.withOpacity(.70),  // 선택 안된 아이템의 색상
        selectedFontSize: 14, // 선택된 아이템 폰트 사이즈
        unselectedFontSize: 10, // 선택 안된 아이템의 폰트 사이즈
        currentIndex: _selectedIndex,

        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: bottomItems,),
      body: pages[_selectedIndex],
    );
  }
}