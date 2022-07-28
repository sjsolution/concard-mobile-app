import 'package:concard/Constants/Colors.dart';
import 'package:concard/Views/screens/homeScreens/manageCompanyCards.dart';
import 'package:concard/Views/widgets/customNextButton.dart';
import 'package:flutter/material.dart';
import 'package:concard/Views/screens/globals.dart' as globals;
class AddCompanyCards extends StatefulWidget {
  AddCompanyCards({Key? key}) : super(key: key);

  @override
  State<AddCompanyCards> createState() => _AddCompanyCardsState();
}

class _AddCompanyCardsState extends State<AddCompanyCards> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
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
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: size.height * 0.02,
                        color: bckgrnd,
                      )),
                  Text(
                    'Company Members',
                    style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontFamily: "MBold",
                        color: bckgrnd),
                  ),
                  Container(
                    height: 5,
                    width: 10,
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
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  right: size.width * 0.04,
                  top: size.height * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    globals.isReplace!?'Replace current employee':'Add Premium Member',
                    style: TextStyle(
                        fontSize: size.height * 0.018, fontFamily: "MBOld"),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Center(
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width * 0.8,
                      child: TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Please enter employee email address',
                          contentPadding: EdgeInsets.only(
                              top: 0.0, left: 22.0, bottom: 2.0),
                          hintStyle: TextStyle(
                              fontSize: size.height * 0.018, color: infocolor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Center(
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width * 0.8,
                      child: TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Please enter employee Device ID',
                          contentPadding: EdgeInsets.only(
                              top: 0.0, left: 22.0, bottom: 2.0),
                          hintStyle: TextStyle(
                              fontSize: size.height * 0.018, color: infocolor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.6,
                  ),
                  Center(
                      child: CustomNextButton(
                          text: globals.isReplace!?"Replace":"Add",
                          image: '',
                          color1: signupclor_light,
                          color2: signupclor_dark,
                          onTap: () {
                           
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        ManageCompanyCardsScreen()));
                                                        }))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
