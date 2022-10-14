 import 'package:concard/Constants/colors.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

loaderWidget(BuildContext? context,Size? size){
    context!.read<AppProvider>().isLoading!? showDialog(
      barrierDismissible: false,
      context: context,
       builder:(context){
        return Container(
          alignment:Alignment.center,
          height: size!.height*.06,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color:Colors.white
          ),
          child: SpinKitDualRing(color: primarygreen),
        );
       } ):const SizedBox();
  }