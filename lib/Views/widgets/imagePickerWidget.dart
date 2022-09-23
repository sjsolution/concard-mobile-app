import 'package:concard/Constants/colors.dart';
import 'package:flutter/material.dart';

void getImageType(BuildContext context, Function()? onTapForGallery,
    Function()? onTapForCamera) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(builder: (context, stateChanges) {
          return Container(
              height: 250,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      "C O N C A R D",
                      style: TextStyle(color: primarygreen, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: onTapForGallery,
                      child: Row(
                        children: [
                          Icon(
                            Icons.panorama,
                            color: primarygreen,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text(
                            "From Gallery",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: onTapForCamera,
                      child: Row(
                        children: [
                          Icon(
                            Icons.photo_camera,
                            color: primarygreen,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Text(
                            "Take Photo",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
      });
}
