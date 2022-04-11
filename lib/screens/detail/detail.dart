import 'package:flutter/material.dart';
import 'package:flutter_app/models/task.dart';
import 'package:flutter_app/screens/detail/date_picker.dart';
import 'package:flutter_app/screens/detail/taskList.dart';
import 'package:flutter_app/screens/detail/task_title.dart';
class DetailPage extends StatelessWidget {
  final Task task ;
   const DetailPage({Key? key,required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailList = task.desc;
    return  Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
              ),
              child: Column(
                children: const [
                   DatePicker(),
                   TaskTitle()
                ],
              )
            ),
          ),
          detailList == null ?
          SliverFillRemaining(
            child: Container(
              color: Colors.white,
              child: const Center(
                child: Text('No task today',style: TextStyle(color: Colors.grey,fontSize: 18),),
              )
            )
          ):
          SliverList(delegate: SliverChildBuilderDelegate(
              (_,index) =>  TaskListTimeLine(taskList: detailList[index]),
            childCount: detailList.length
          ))
        ],
      )
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 60,
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back_ios),
        iconSize: 20,
      ),
      actions: const [
        Icon(Icons.more_vert,size: 40,),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${task.title} tasks',style:  const TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            Text('You have ${task.left} tasks for today',style: TextStyle(fontSize: 12,color: Colors.grey[700]),)

          ],
        ),
      ),
    );
  }
}
