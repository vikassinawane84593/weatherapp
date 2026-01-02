import 'package:flutter/material.dart';
class  Wethercastimfo extends StatelessWidget{
   final String time;
   final IconData icon;
   final String tem;
   const Wethercastimfo({
    super.key,
    required this.time,
    required this.icon,
    required this.tem
  });
  @override
  Widget build(BuildContext context ){
    return SizedBox(
      width: 100,
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(time,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height:8,),
              Icon(icon,size:32),
              SizedBox(height: 8,),
              Text(tem,),
            ],
          ),
        ),
      ),
    );
  }
}