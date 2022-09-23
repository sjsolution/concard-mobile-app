import 'package:concard/Constants/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadWidget extends StatelessWidget {
  const ShimmerLoadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 1.0,
      width: size.width,
      child: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: 5,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.2),
              highlightColor: Colors.white,
              child: Container(
                  margin: EdgeInsets.only(
                      top: size.height * 0.02,
                      left: size.width * 0.04,
                      right: size.width * 0.04),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: size.height * 0.03,
                            backgroundColor: Colors.grey,
                          ),
                          SizedBox(width: size.width * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: size.height * 0.02,
                                  width: size.width * .4,
                                  color: Colors.grey),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              Container(
                                  height: size.height * 0.02,
                                  width: size.width * .6,
                                  color: Colors.grey),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: cgreen,
                                child: Text(
                                  '',
                                  style: TextStyle(
                                      fontSize: size.height * 0.018,
                                      color: bckgrnd),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.015,
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                    fontSize: size.height * 0.015,
                                    fontFamily: "Msemibold",
                                    color: infocolor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  )),
            );
          }),
    );
  }
}
