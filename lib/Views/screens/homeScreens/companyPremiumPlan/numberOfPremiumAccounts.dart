import 'package:concard/Constants/colors.dart';
import 'package:concard/Views/screens/homeScreens/companyPremiumPlan/upgradeCompanyPlanScreen.dart';
import 'package:concard/Views/widgets/customButton.dart';
import 'package:concard/Views/widgets/fieldText.dart';
import 'package:flutter/material.dart';

class NumberOfPremiumAccounts extends StatefulWidget {
  NumberOfPremiumAccounts({Key? key}) : super(key: key);

  @override
  State<NumberOfPremiumAccounts> createState() => _NumberOfPremiumAccountsState();
}

class _NumberOfPremiumAccountsState extends State<NumberOfPremiumAccounts> {
   bool? isColrChnge=false;
  bool? isClrchng=false;
  bool? isChng=false;
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;    return Scaffold(
      body:  Stack(
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
            child:Padding(
              padding:  EdgeInsets.only(left: size.width*0.04,right:size.width*0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios,size: size.height*0.02,color: bckgrnd,)),
                  Container(
                    margin: EdgeInsets.only(top: size.height*0.01),
                    child: Text('Manage membership',style: TextStyle(
                      fontFamily: "MBold",
                      fontSize:size.height*0.018,
                      color:bckgrnd
                    ),),
                  ),
                   Container(
                        height: size.height*0.03,
                        width: size.width*0.08,
                      )
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
              child: Padding(
                 padding:  EdgeInsets.only(left: size.width*0.04,right:size.width*0.04,top: size.height*0.03),
                child: Column(
                  children: [
                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Container(
                          color: infocolor,
                          height: size.height*0.001,
                          width: size.width*0.2,
                        ) ,
                        Text('Choose the plan you like',
                      style: TextStyle(
                        fontSize:size.height*0.018,
                        fontFamily:"Mbold",
                        
                        
                      ),),
                        Container(
                          color: infocolor,
                          height: size.height*0.001,
                          width: size.width*0.2,
                        ) ,
                                         ],
                      ),
                      SizedBox(
                        height: size.height*0.02,
                      ),
                       Padding(
                      padding:  EdgeInsets.only(left: size.width*0.03,right: size.width*0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                isColrChnge=true;
                                isClrchng=false;
                                isChng=false;
                              });
                            },
                            child: Container(
                              height: size.height*0.13,
                              width: size.width*0.25,
                              decoration: BoxDecoration(
                                border: Border.all(color: gradientgreen),
                              gradient: isColrChnge!? LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors:[
                                   signupclor_light,
                                  signupclor_dark
                                ]): LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors:[
                                 btnclr,
                                 btnclr
                                ]
                              ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                   Text('Monthly',
                                                style: TextStyle(
                                                  fontSize:size.height*0.018,
                                                  fontFamily:"Mbold",
                                                  color: isColrChnge!? bckgrnd:gradientgreen
                                                ),),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                            Text('5 ',
                            style: TextStyle(
                              fontSize:size.height*0.022,
                              fontFamily:"Msemibold",
                              color: isColrChnge!? bckgrnd:gradientgreen
                            ),),
                            Text('USD',
                                                style: TextStyle(
                                                  fontSize:size.height*0.015,
                                                  fontFamily:"Stf",
                                                  color: isColrChnge!? bckgrnd:gradientgreen
                                                ),),
                                                  ],
                                                ),
                                                 Text('per user',
                                                style: TextStyle(
                                                  fontSize:size.height*0.011,
                                                  fontFamily:"Stf",
                                                  color: isColrChnge!? bckgrnd:gradientgreen
                                                ),),

                                                Text('Automatic renewal',
                                                style: TextStyle(
                                                  fontSize:size.height*0.011,
                                                  fontFamily:"Stf",
                                                  color: isColrChnge!? bckgrnd:gradientgreen
                                                ),),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                isClrchng=true;
                                isColrChnge=false;
                                isChng=false;
                              });
                            },
                            child: Container(
                              height: size.height*0.13,
                              width: size.width*0.25,
                              decoration: BoxDecoration(
                                border: Border.all(color: gradientgreen),
                                gradient: isClrchng!? LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors:[
                                   signupclor_light,
                                  signupclor_dark
                                ]): LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors:[
                                 btnclr,
                                 btnclr
                                ]
                              ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                   Text('Annually',
                                                style: TextStyle(
                                                  fontSize:size.height*0.018,
                                                  fontFamily:"Mbold",
                                                  color: isClrchng!? bckgrnd:gradientgreen
                                                ),),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                            Text('30 ',
                            style: TextStyle(
                              fontSize:size.height*0.022,
                              fontFamily:"Msemibold",
                              color: isClrchng!? bckgrnd:gradientgreen
                            ),),
                            Text('USD',
                                                style: TextStyle(
                                                  fontSize:size.height*0.015,
                                                  fontFamily:"Stf",
                                                  color: isClrchng!? bckgrnd:gradientgreen
                                                ),),
                                                  ],
                                                ),
                                                 Text('per user',
                                                style: TextStyle(
                                                  fontSize:size.height*0.011,
                                                  fontFamily:"Stf",
                                                  color: isClrchng!? bckgrnd:gradientgreen
                                                ),),
                                                Text('Automatic renewal',
                                                style: TextStyle(
                                                  fontSize:size.height*0.011,
                                                  fontFamily:"Stf",
                                                  color: isClrchng!? bckgrnd:gradientgreen
                                                ),),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                isChng=true;
                                isClrchng=false;
                                isColrChnge=false;
                              });
                            },
                            child: Container(
                              height: size.height*0.13,
                              width: size.width*0.25,
                              decoration: BoxDecoration(
                                border: Border.all(color: gradientgreen),
                               gradient: isChng!? LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors:[
                                   signupclor_light,
                                  signupclor_dark
                                ]): LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors:[
                                 btnclr,
                                 btnclr
                                ]
                              ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                   Text('5 Years',
                                                style: TextStyle(
                                                  fontSize:size.height*0.018,
                                                  fontFamily:"Mbold",
                                                  color: isChng!? bckgrnd:gradientgreen
                                                ),),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                            Text('100 ',
                            style: TextStyle(
                              fontSize:size.height*0.022,
                              fontFamily:"Msemibold",
                              color: isChng!? bckgrnd:gradientgreen
                            ),),
                            Text('USD',
                                                style: TextStyle(
                                                  fontSize:size.height*0.015,
                                                  fontFamily:"Stf",
                                                  color: isChng!? bckgrnd:gradientgreen
                                                ),),
                                                  ],
                                                ),
                                                 Text('per user',
                                                style: TextStyle(
                                                  fontSize:size.height*0.011,
                                                  fontFamily:"Stf",
                                                  color: isChng!? bckgrnd:gradientgreen
                                                ),),
                                                Text('Non-subscription',
                                                style: TextStyle(
                                                  fontSize:size.height*0.011,
                                                  fontFamily:"Stf",
                                                  color: isChng!? bckgrnd:gradientgreen
                                                ),),
                                ],
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.02,
                    ),
                    FieldText( validate: (String? value){
                        return '';
                      },hinttxt: "Number of accounts (Minimum 5 accounts)", controller: controller, textInputType: TextInputType.number, pass: false),
                     SizedBox(
                      height: size.height*0.04,
                    ),
                    Container(
                      height: size.height*0.05,
                      width: size.width*0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            gradientgreen,
                            primarygreen
                          ]
                        ),
                      ),
                      child: Center(
                        child: Text('TOTAL= \$ 150',
                        style: TextStyle(
                          color: bckgrnd,
                          fontSize: size.height*0.018,
                          fontFamily: "Stf"
                        ),),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.4,
                    ),
                     InkWell(
                       onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>UpgradeCompanyPlanScreen()));
                       },
                       child: Container(
                         alignment: Alignment.bottomCenter,
                        height: size.height*0.05,
                        width: size.width*0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              signupclor_light,
                              signupclor_dark
                            ]
                          ),
                        ),
                        child: Center(
                          child: Text('Change',
                          style: TextStyle(
                            color: bckgrnd,
                            fontSize: size.height*0.018,
                            fontFamily: "MBold"
                          ),),
                        ),
                                         ),
                     ),
                ]),
              ),
              
        )
      ],
    ),
    );
  }
}