import 'package:flutter/material.dart';

class ListViewTest extends StatelessWidget {
  const ListViewTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List view test'),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
              return _buildItemListView(index);
          })
      );
  }

  Widget _buildItemListView(int index) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blueAccent[200],
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
      child: Center(
        child: Text('Item $index',style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
      ),
    );
  }
}
