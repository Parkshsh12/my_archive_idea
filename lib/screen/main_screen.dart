import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Archive Idea',
          style: TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return listItem(index);
          },
        ),
      ),
    );
  }

  Widget listItem(int index) {
    return Container(
      height: 82,
      margin: EdgeInsets.only(top: 16),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xffd9d9d9), width: 1),
        borderRadius: BorderRadius.circular(10),
      )),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          /// 아이디어 제목
          Container(
            margin: EdgeInsets.only(
              left: 16,
              bottom: 16,
            ),
            child: Text(
              '# 환경보존 문제해결 앱 아이디',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),

          /// 일시
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(right: 16, bottom: 8),
              child: Text(
                '2023.10.03 09:00',
                style: TextStyle(
                  color: Color(0xffaeaeae),
                  fontSize: 10,
                ),
              ),
            ),
          ),
          /// 아이디어 중요도 점수
        ],
      ),
    );
  }
}
