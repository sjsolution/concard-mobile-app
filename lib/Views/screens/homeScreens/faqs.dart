import 'package:concard/Constants/Colors.dart';
import 'package:flutter/material.dart';

class FAQSScreen extends StatefulWidget {
  const FAQSScreen({Key? key}) : super(key: key);

  @override
  State<FAQSScreen> createState() => _FAQSScreenState();
}

class _FAQSScreenState extends State<FAQSScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      // alignment: Alignment.centerLeft,
      children: [
        Container(
          height: size.height * 0.15,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topCenter,
                colors: [signupclor_light, signupclor_dark]),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: size.height * 0.02,
                    color: bckgrnd,
                  ),
                ),
                Text(
                  'FAQs',
                  style: TextStyle(
                    fontSize: size.height * 0.020,
                    color: bckgrnd,
                    fontFamily: 'MBold',
                  ),
                ),
                Container(
                  height: size.height * 0.02,
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: size.height * 0.13),
          // height: size.height*0.8,
          width: size.width,
          decoration: BoxDecoration(
              color: btnclr,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                child: Text(
                  'Most Asked Questions',
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    color: txtcolr,
                    fontFamily: 'MBold',
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: size.height * 0.3,
                width: size.width,
                decoration: BoxDecoration(
                  color: cgreen.withOpacity(0.2),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'How to reset my password?',
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                color: txtcolr,
                                fontFamily: 'MBold'),
                          ),
                          Icon(
                            Icons.keyboard_arrow_up,
                            // size: size.height * 0.03,
                            color: txtcolr,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Text(
                        'Access / Code request for Company members\n- Request for a premium code\n- Enter Code to upgrade to premium\n(must be registered with company email ID)\ncode will be sent to his Adminstrator\nAccess / Code request for Company members\n- Request for a premium code\n- Enter Code to upgrade to premium\n(must be registered with company email ID)\ncode will be sent to his Adminstrator',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Mbold',
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.030,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Can I change my registered email?',
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: 'Mmedium'),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Divider(
                        height: size.height * 0.03,
                        color: Color(0xffE6E6E6),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.010,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Can I change my registered phone number?',
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: 'Mmedium'),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Divider(
                        height: size.height * 0.03,
                        color: Color(0xffE6E6E6),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.010,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'How to redeem premium code?',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: 'Mmedium'),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Divider(
                        height: size.height * 0.03,
                        color: Color(0xffE6E6E6),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.010,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'How can I get support for any problem or\nquestion?',
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              fontFamily: 'Mmedium'),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
