import 'package:concard/Constants/colors.dart';
import 'package:concard/Views/screens/homeScreens/companyPremiumPlan/upgradeCompanyPlanScreen.dart';
import 'package:flutter/material.dart';

import '../../../../Constants/images.dart';

class ReduceAccountsScreen extends StatefulWidget {
  ReduceAccountsScreen({Key? key}) : super(key: key);

  @override
  State<ReduceAccountsScreen> createState() => _ReduceAccountsScreenState();
}
String? isSelect;
 bool? isSelected=false;
class _ReduceAccountsScreenState extends State<ReduceAccountsScreen> {
 
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
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
            child:  Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
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
                      )),
                  Text(
                    'Manage membership',
                    style: TextStyle(
                        fontFamily: "MBold",
                        fontSize: size.height * 0.018,
                        color: bckgrnd),
                  ),
                  Container(
                    height: size.height * 0.03,
                    width: size.width * 0.08,
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
                        Text('Select card(s) to remove',
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
                        height: size.height*0.03,
                      ),
                      Row(
                        children: [
                          Icon(Icons.check,color: signupclor_light,size: size.height*0.03,),
                          SizedBox(width: size.width*0.03,),
                          Text('(1) Card Selected',
                          style: TextStyle(
                            fontFamily: "MBold",
                            fontSize: size.height*0.015,
                          ),)
                        ],
                      ),
                       Container(
                        height: size.height*0.65,
                        width: size.width,
                        child: ListView.builder(
                          padding: EdgeInsets.all(0),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context,index){
                            return Container(
                              margin: EdgeInsets.only(top: size.height*0.02),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Radio(
                              value: index.toString(),
                              groupValue: isSelect,
                              onChanged: (dynamic newValue) =>
                                  setState(() => isSelect= newValue),
                              activeColor: signupclor_light,
                              // selected: false,
                        ),
                                  Container(
                                    child: ClipRRect(
                                      child: Image.asset(mycard_icon,fit: BoxFit.cover,),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    height: size.height*0.08,
                                    width: size.width*0.3,
                                  ),
                                  SizedBox(width: size.width*0.04,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Company Name',style: TextStyle(
                                          fontSize: size.height*0.015,
                                          fontFamily:"MBold"
                                      ),),
                                      SizedBox(height: size.height*0.02,),
                                      Text('Lorem ipsum dolor sit amet',style: TextStyle(
                                          fontSize: size.height*0.01,
                                          fontFamily: "Msemibold",
                                          color: infocolor
                                      ),),
                                      SizedBox(height: size.height*0.01,),
                                      Text('Concsectetuer adipiscing elit, sed fiam',style: TextStyle(
                                          fontSize: size.height*0.01,
                                          fontFamily: "Msemibold",
                                          color: infocolor
                                      ),),
                                    ],
                                  ),

                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height*0.02,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>UpgradeCompanyPlanScreen()));
                        },
                        child: Center(
                          child: Container(
                            height: size.height*0.05,
                            width: size.width*0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: crs_clr),
                              color: btnclr
                            ),
                            child: Center(
                              child: Text('Remove Account(s)',style: TextStyle(
                                fontFamily: "MBold",
                                fontSize: size.height*0.018,
                                color: crs_clr
                              ),),
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
        )
      ],
    ),
    );
  }
}