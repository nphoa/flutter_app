import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
class TaskListTimeLine extends StatelessWidget {
  final Map<String,dynamic> taskList;
  const TaskListTimeLine({Key? key,required this.taskList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          _buildTimeline(taskList['tlColor']),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(taskList['time']),
                  _buildCard(taskList['tlColor'], taskList)
                ],
              )
          )
        ],
      )
    );
  }

  Widget _buildTimeline(Color color){
    return Container(
      height: 80,
      width: 20,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0,
          width: 15,
          indicator: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(width: 5,color: color)
            ),
          )
        ),
        afterLineStyle: LineStyle(
          thickness: 5,
          color: color
        ),
      ),
    );
  }
  Widget _buildCard(Color color, Map<String,dynamic> taskList) {
    if(taskList['title'].isNotEmpty) {
      return Container(
        width: 250,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskList['title'],style:  const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            Text(taskList['slot'],style: const TextStyle(fontSize: 12)),
          ],
        ),
      );
    }
    return Container(
      color: Colors.white,
    );
  }
}
