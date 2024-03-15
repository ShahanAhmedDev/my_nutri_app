import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NameHeartNotificationWidget extends StatefulWidget {
  const NameHeartNotificationWidget({super.key});

  @override
  State<NameHeartNotificationWidget> createState() => _NameHeartNotificationWidgetState();
}

class _NameHeartNotificationWidgetState extends State<NameHeartNotificationWidget> {
  @override
  static const IconData heart = IconData(0xf442);

  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Good Morning Jacky',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
        Row(
          children: [
            Image.asset("images/heart_icon.png",height: 20,),
            SizedBox(width: 10,),
            Image.asset("images/notification.png",height: 25,),
          ],
        ),
      ],
    );
  }
}
