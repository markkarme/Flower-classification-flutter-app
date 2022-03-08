import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onPress =(){};
  IconData icon = Icons.clear;
  String tittle = "";
  CustomButton(this.onPress,this.icon,this.tittle);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(56),
          primary: Color.fromARGB(255, 248, 217, 1),
          onPrimary: Colors.white,
          textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
        child: Row(
          children: [
            Icon(icon,size: 28,),
            const SizedBox(width: 16,),
            Text(tittle)
          ],
        )
    );
  }
}
