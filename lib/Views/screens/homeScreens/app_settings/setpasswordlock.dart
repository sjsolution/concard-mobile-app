import 'package:concard/Constants/images.dart';
import 'package:concard/Views/screens/homeScreens/app_settings/appSettingsScreen.dart';
import 'package:flutter/material.dart';
import '../../../../Constants/Colors.dart';
import 'aaplock.dart';

class Setpasswordlock extends StatefulWidget {
  const Setpasswordlock({ Key? key }) : super(key: key);

  @override
  State<Setpasswordlock> createState() => _SetpasswordlockState();
}

class _SetpasswordlockState extends State<Setpasswordlock> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
    backgroundColor: Color(0xffF7F7F7),
    body: Stack(
      children: [
        Container(
            height: size.height*0.15,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topCenter,
                  colors: [
                    signupclor_light,
                    signupclor_dark
                  ]
              ),
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
                    'Set Password lock',
                    style: TextStyle(
                      fontSize: size.height * 0.020,
                      color: bckgrnd,
                      fontFamily: 'MBold',
                    ),
                  ),
                  Container(
                    height: size.height * 0.02,
                  ),
                ],
              ),
            ),
        ),
        Container(
          margin: EdgeInsets.only(top: size.height*0.13),
          // height: size.height*0.8,
          width: size.width,
          decoration: BoxDecoration(
              color: btnclr,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              )),
              child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Image.asset(
                    setpassword,
                    height: size.height * 0.1,
                  ),
                  SizedBox(
                    height: size.height * 0.050,
                  ),
                  Text(
                    ' Protect your data with a unique password',
                    style: TextStyle(
                        fontSize: size.height * 0.018, fontFamily: 'MBold'),
                  ),
                  SizedBox(
                    height: size.height * 0.050,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:12,right: 12),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: size.height*0.03,left: size.height*0.040),
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: size.height*0.018,fontFamily: 'Mbold',color: Color(0xffC6C6C6)),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(10),
                          borderSide: BorderSide(color:Colors.transparent),
                           ),
                           focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30),
                           borderSide: BorderSide(color: Colors.transparent)
                           ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.050,),
                   Padding(
                      padding: const EdgeInsets.only(left:12,right: 12),
                     child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: size.height*0.03,left: size.height*0.040),
                        hintText: 'Retype your password',
                        hintStyle: TextStyle(fontSize: size.height*0.018,fontFamily: 'Mbold',color: infocolor),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(10),
                          borderSide: BorderSide(color:Colors.transparent),
                           ),
                           focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(30),
                           borderSide: BorderSide(color: Colors.transparent)
                           ),
                      ),
                  ),
                   ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: InkWell(
                      onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => AppSettingsScreen())));
                                showDialog(
                                  context: context,
                                   builder:(BuildContext context){
                                     return Container(
                                margin:
                                    EdgeInsets.only(bottom: size.height * 0.1),
                                    // width: size.width*1.0,
                                child: AlertDialog(
                                  
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  alignment: AlignmentDirectional.bottomCenter,
                                  actionsAlignment: MainAxisAlignment.center,
                                  title: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: txtcolr,
                                    child: Icon(Icons.check,size:size.height*0.03,color: Colors.white,)
                                  ),
                                  content: Text(
                                    'Your App is now protected with Password Lock',
                                    style: TextStyle(
                                        fontSize: size.height * 0.014,
                                        fontFamily: 'Stf'),
                                  ),
                                  actions: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    Applockscreen())));
                                      },
                                      child: Container(
                                        height: size.height * 0.05,
                                        width: size.width * 0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: signupclor_dark),
                                        ),
                                        child: Center(
                                            child: Text(
                                          'OK',
                                          style: TextStyle(
                                              fontSize: size.height * 0.015,
                                              fontFamily: 'MBold',
                                              color: signupclor_dark),
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                                   }
                                );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: size.height * 0.27),
                        height: size.height * 0.06,
                        width: size.width * 1.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,
                            colors: [
                              signupclor_light,
                              signupclor_dark,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'continue',
                            style: TextStyle(
                              color: bckgrnd,
                              fontFamily: 'MBold',
                              fontSize: size.height * 0.020,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ),
      ],
    ),
      
    );
  }
}