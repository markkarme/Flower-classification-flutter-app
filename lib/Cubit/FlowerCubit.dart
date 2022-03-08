// ignore: file_names
// ignore_for_file: file_names





import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flower_recognition_app/Cubit/FlowerState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class FlowerCubit extends Cubit<FStates>{
  FlowerCubit(): super(InitialStates());
  File? image;
  List? result ;

  Future pickImage(ImageSource source) async{

    final image = await ImagePicker().pickImage(source: source);

    if(image == null) {
      //classifiyFlower(data);
      return null;
    }
    var data = File(image.path);
    this.image =  data;
    print(data.path);
    await classifyImage(image.path);
  }
  static FlowerCubit getCubit(context){
    return BlocProvider.of(context);
  }
  loadModel()async{
    emit(LoadingModel());
    await Tflite.loadModel(
        model: "assets/tf_lite_model.tflite",
        labels: "assets/labels.txt",
        numThreads: 1, // defaults to 1
        isAsset: true, // defaults to true, set to false to load resources outside assets
        useGpuDelegate: false // defaults to false, set to true to use GPU delegate
    );
    emit(OpendModelFile());
  }
  classifyImage(String image) async {
    emit(ClassifyingImage());
    result = await Tflite.runModelOnImage(
      path: image,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print(result);
  }
// @override
// void dispose() {
//   bloc.dispose();
//   super.dispose();
// }
}