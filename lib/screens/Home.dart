// ignore: file_names
// ignore_for_file: file_names



import 'package:flower_recognition_app/Cubit/FlowerCubit.dart';
import 'package:flower_recognition_app/Cubit/FlowerState.dart';
import 'package:flower_recognition_app/GeneralComponets/custom_button.dart';
import 'package:flower_recognition_app/constants.dart';
import 'package:flower_recognition_app/screens/Result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlowerCubit,FStates>(listener: (context,state){

    }, builder: (context,state){
      Size size = MediaQuery.of(context).size;
      var mycubit = FlowerCubit.getCubit(context);
      return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text("Flower Classfication",style: TextStyle(fontSize: 25),)
        ),
            backgroundColor: textColor,
        ),
        body: Container(
          color: Color.fromARGB(255, 19, 113, 89),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(child: Image.asset("assets/Geek's.png",height: size.height*0.5,)),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: CustomButton(() async{
                  await mycubit.pickImage(ImageSource.gallery);
                  print(mycubit.result);
                  if(mycubit.image !=null){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Result(mycubit.image,mycubit.result);
                    }));
                  }

                }, Icons.image_outlined, "Pick Gallery"),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: CustomButton(() async{
                  await mycubit.pickImage(ImageSource.camera);
                  if (mycubit.image != null){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Result(mycubit.image,mycubit.result);
                    }));
                  }

                }, Icons.camera_alt_outlined, "Pick Camera"),
              ),
            ],
          ),
        ),
      );
    });
  }
}
