// ignore: file_names
// ignore_for_file: file_names

import 'dart:io';

import 'package:flower_recognition_app/Cubit/FlowerCubit.dart';
import 'package:flower_recognition_app/Cubit/FlowerState.dart';
import 'package:flower_recognition_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Result extends StatelessWidget {
  File? image;
  List? result;
  Result(this.image,this.result);

  @override
  Widget build(BuildContext context) {
    String flowerType = result![0]["label"].split(' ')[1];

      return Scaffold(
        appBar: AppBar(title: Text("Flower Classfication"),backgroundColor: textColor,),
        body: Container(
          color: Color.fromARGB(255, 19, 113, 89),
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(child: Image.file(image!)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Flower Type :",style: TextStyle(fontSize: 30,color: textColor),),
                  Text(flowerType,style: TextStyle(fontSize: 30,color: textColor),),
                ],
              ),
              SizedBox(height: 30,),
              Text(flowerDetails[flowerType]!,style: TextStyle(fontSize: 30,color: textColor),),

            ],
          ),
        ),
      );

  }
}
