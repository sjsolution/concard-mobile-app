import 'package:concard/Views/screens/homeScreens/companyPremiumPlan/ReduceAccountsScreen.dart';
import 'package:concard/Views/screens/homeScreens/companyPremiumPlan/numberOfPremiumAccounts.dart';
import 'package:concard/Views/screens/homeScreens/individualPremium/cancelMembershipScreen.dart';
import 'package:flutter/material.dart';

import '../../../../Constants/colors.dart';
import '../../../../Constants/images.dart';

class ManageCompanyPremiumPlan extends StatefulWidget {
  ManageCompanyPremiumPlan({Key? key}) : super(key: key);

  @override
  State<ManageCompanyPremiumPlan> createState() => _ManageCompanyPremiumPlanState();
}

class _ManageCompanyPremiumPlanState extends State<ManageCompanyPremiumPlan> {
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
            margin: EdgeInsets.only(top: size.height * 0.13),
            // height: size.height*0.8,
            width: size.width,
            decoration: BoxDecoration(
                color: bckgrnd,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                )),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Stack(
                  children: [
                    Center(
                      child: CircleAvatar(
                          radius: size.height * 0.04, backgroundColor: btnclr),
                    ),
                    ClipRRect(
                      child: Center(
                        child: Image.asset(
                          premium_icon,
                          height: size.height * 0.06,
                          // scale: size.height*0.01,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Premium membership: \$ 5/month/user',
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    fontFamily: "Mbold",
                  ),
                ),
                Text(
                  'Next billing date: Apr 16, 2022',
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    fontFamily: "Stf",
                  ),
                ),
                  Text(
                  'Number of premium accounts:10',
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    fontFamily: "Stf",
                  ),
                ),
                  Text(
                  'Active premium accounts: 9',
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    fontFamily: "Stf",
                  ),
                ),
                SizedBox(
                  height: size.height*0.03,
                ),
                Container(
                  height: size.height * 0.38,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: btnclr),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height*0.02,),
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.03),
                          child: Text(
                            'Upcoming Payments',
                            style: TextStyle(
                                fontSize: size.height * 0.018,
                                fontFamily: "Mbold",
                                color: gradientgreen),
                          ),
                        ),
                         SizedBox(height: size.height*0.02,),
                        Padding(
                          padding: EdgeInsets.only(left: size.width*0.03,right: size.width*0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'May 16, 2022',
                                style: TextStyle(
                                  fontSize: size.height * 0.015,
                                  fontFamily: "Stf",
                                ),
                              ),
                              Text(
                                'Premiun, Monthly \$5/ Monthly',
                                style: TextStyle(
                                  fontSize: size.height * 0.015,
                                  fontFamily: "Stf",
                                ),
                              ),
                            ],
                          ), 
                        ),
                        SizedBox(height:size.height*0.02),
                         Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.03,right: size.width*0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                              'Payment method',
                              style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontFamily: "Mbold",
                                  color: gradientgreen),
                            ),
                            Container(
                              height:size.height*0.04,
                              width: size.width*0.15,
                              decoration: BoxDecoration(
                                color: btnclr,
                                border: Border.all(color: gradientgreen),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(child: Text('Edit',
                              style: TextStyle(
                                fontSize: size.height*0.015,
                                fontFamily: "MBold",
                                color: gradientgreen
                              ),
                              )),
                            )
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: size.width*0.01),
                            child: Row(
                              children: [
                                Image.asset(visapay,height:size.height*0.05),
                                SizedBox(
                                  width: size.width*0.03,
                                ),
                                Text('Card ending with **89')
                              ],),
                          ),
                          SizedBox(height:size.height*0.02),
                         Divider(
                            thickness: 1,
                          ),
                          SizedBox(
                            height: size.height*0.01,
                          ),
                          InkWell(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>NumberOfPremiumAccounts()));
                            },
                            child: Padding(
                              padding:  EdgeInsets.only(left: size.width*0.03,right: size.width*0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                'Change number of premium accounts',
                                style: TextStyle(
                                    fontSize: size.height * 0.017,
                                    fontFamily: "Mbold",
                                    color: gradientgreen),
                              ),
                              Container(
                                height:size.height*0.04,
                                width: size.width*0.15,
                                decoration: BoxDecoration(
                                  color: btnclr,
                                  border: Border.all(color: gradientgreen),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Center(child: Text('Add',
                                style: TextStyle(
                                  fontSize: size.height*0.015,
                                  fontFamily: "MBold",
                                  color: gradientgreen
                                ),
                                )),
                              )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: size.width*0.03),
                            child: Text('10 premium Accounts'),
                          )
                      ]),
                ),
                
                SizedBox(
                  height: size.height*0.15,
                ),
                Padding(
                  padding:  EdgeInsets.only(left:size.width*0.07,right: size.width*0.07),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>ReduceAccountsScreen()));
                        },
                        child: Container(
                          height:size.height*0.05,
                          width:size.width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: signupclor_dark),
                            borderRadius:BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: size.width*0.01,right: size.width*0.03),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Image.asset(pause_icon),
                                Icon(Icons.keyboard_arrow_down),
                                Text('Reduce accounts',
                                style:TextStyle(
                                  fontSize: size.height*0.014,
                                  fontFamily: "MBold",
                                  color: signupclor_dark
                                )
                                ),
                              ]),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>CancelMembershipScreen()));
                        },
                        child: Container(
                          height:size.height*0.05,
                          width:size.width*0.4,
                          decoration: BoxDecoration(
                            border: Border.all(color: crs_clr),
                            borderRadius:BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding:  EdgeInsets.only(left: size.width*0.01,right: size.width*0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.close,color: crs_clr,),
                                Text('Cancle membership',
                                style:TextStyle(
                                  fontSize: size.height*0.014,
                                  fontFamily: "MBold",
                                  color: crs_clr
                                )
                                ),
                              ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
 
}
