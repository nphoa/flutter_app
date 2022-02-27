import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/go_premium.dart';
import 'package:flutter_app/widgets/tasks.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return  AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          SizedBox(
            height: 45,
            width: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('images/img_avatar.png'),
            ),
          ),
          const SizedBox(width: 10,),
          const Text(
            'Hi, NguyenPH',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
      actions: const [
        Icon(Icons.more_vert,
          color: Colors.black,
          size: 40,
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
           const GoPremium(),
           Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              'Tasks',
              style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Tasks())
        ],
      ),
    );
  }
}
