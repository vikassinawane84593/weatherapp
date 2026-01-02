import 'package:flutter/material.dart';

class AdditionalInformatonshow extends StatelessWidget{
   final IconData icon;
   final String condition;
   final String value;
   const AdditionalInformatonshow({
    super.key,
    required this.icon,
    required this.condition,
    required this.value,

  });
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Icon( icon,size:32),
        SizedBox(height: 10,),
        Text(value),
        SizedBox(height: 10,),
        Text(condition,style:TextStyle(fontWeight:FontWeight.bold))
      ],
    );
  }
}
