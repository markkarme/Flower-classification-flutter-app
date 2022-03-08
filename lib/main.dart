import 'package:flower_recognition_app/BlocObserver.dart';
import 'package:flower_recognition_app/Cubit/FlowerCubit.dart';
import 'package:flower_recognition_app/screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
        () {
          runApp(
              MaterialApp(debugShowCheckedModeBanner: false,
                home: BlocProvider(
                  create: (_)=>FlowerCubit()..loadModel(),
                  child: Home(),
                ),
              ));
          },
    blocObserver: MyBlocObserver(),
  );

}
