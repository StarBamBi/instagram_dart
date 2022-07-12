import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostCard extends StatefulWidget {
  int number;

  PostCard({required this.number});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {

  late int pageLength;
  int currentPageIndex=0; // 사진 현재 페이지

  final PageController _controller = PageController();

  List<String> testImageList = [
    'https://images.everydayhealth.com/images/pet-health/cs-pet-health-cat-exercises-1440x810.jpg',
    'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F34%2F2021%2F01%2F06%2Fginger-cats-cuddling-getty-0121-2000.jpg&q=60',
    'https://cat-world.com/wp-content/uploads/2021/09/grey-and-white-nfc.jpg',
    'https://idsb.tmgrup.com.tr/ly/uploads/images/2021/09/08/thumbs/800x531/142774.jpg',
    'https://i.guim.co.uk/img/media/a18cc41136685daa92674c01fe13d62d9d009f2f/0_298_5616_3370/master/5616.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=fe80fab807de1b6a966053f7ac5f5a08'
  ];

  List testInt = [5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
  double initRatio = 0.5;

  @override
  void initState() {
    pageLength = 3+Random().nextInt(5);
    initRatio = testInt[Random().nextInt(16)]*0.1;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage('https://www.mcicon.com/wp-content/uploads/2021/03/Cat-14.jpg'),
                  ),
                  SizedBox(width: 8,),
                  Text('taejun.kim', style: TextStyle(color: Colors.white,),)
                ],
              ),

              const Icon(Icons.subject)
            ],
          )
        ),
        AspectRatio(
          aspectRatio: initRatio,
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                PageView.builder(
                  controller: _controller,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(testImageList[Random().nextInt(5)], fit: BoxFit.cover,);
                  },
                  itemCount: pageLength,
                  onPageChanged: (value) {
                    setState(() {
                      currentPageIndex=value;
                    });
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(500)
                  ),
                  child: Text('${currentPageIndex+1}/$pageLength', style: const TextStyle(color: Colors.white),),
                )
              ],
            )
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.favorite_border, color: Colors.white,),
                      SizedBox(width: 7,),
                      Icon(Icons.chat_bubble_outline, color: Colors.white,),
                      SizedBox(width: 7,),
                      Icon(Icons.send, color: Colors.white,)
                    ],
                  ),

                  const Icon(Icons.bookmark_border, color: Colors.white,)
                ],
              ),
              SmoothPageIndicator(
                  controller: _controller,  // PageController
                  count:  pageLength,
                  effect:  const WormEffect(
                    spacing: 8,
                    dotHeight: 6,
                    dotWidth: 6
                  ),  // your preferred effect

              ),

            ],

          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Row(
            children: const[
              Text('taejun.kim ', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),),
              Text('ya-yong', style: TextStyle(color: Colors.white, fontSize: 11),),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Row(
            children: [
              Column(
                children: const [
                  Text('댓글 22개 모두 보기', style: TextStyle(color: Colors.grey, fontSize: 10),),
                ],
              )
            ],
          )
        ),
      ],
    );
  }

}