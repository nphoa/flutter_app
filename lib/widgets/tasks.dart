import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_app/screens/detail/detail.dart';
import '../models/task.dart';
class Tasks extends StatelessWidget {
   Tasks({Key? key}) : super(key: key);
   final taskList = Task.generateTasks();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
          itemCount: taskList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemBuilder: (context, index){
            if(taskList[index].isLast == true) {
                return _buildAddTask();
            }
            return _buildTask(context, taskList[index]);
          }),
    );
  }

  Widget _buildAddTask() {
    return DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        dashPattern: const [10,10],
        color: Colors.grey,
        strokeWidth: 2,
        child: const Center(
          child: Text('+ Add',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        )
    );
  }
  Widget _buildTask(BuildContext context, Task task) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailPage(task: task,)));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: task.bgColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(task.iconData,color: task.iconColor,size: 35,),
            const SizedBox(height: 30,),
            Text(task.title!,style: const TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildStatusTask(task.btnColor!, task.iconColor!, '${task.left} left'),
                const SizedBox(width: 5,),
                _buildStatusTask(task.btnColor!, task.iconColor!, '${task.done} done'),
              ],
            )
          ],
        ),
      ),
    );
  }
   Widget _buildStatusTask(Color bgColor, Color txColor, String status) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Text(status,style:TextStyle(fontWeight: FontWeight.bold,color: txColor),),
      );
   }
}
