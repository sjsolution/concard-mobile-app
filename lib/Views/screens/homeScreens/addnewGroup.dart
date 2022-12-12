import 'package:concard/Constants/Colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/GropsController/addGroup_controller.dart';
import 'package:flutter/material.dart';
import 'package:concard/Constants/globals.dart' as Globals;



class AddNewGroupScreen extends StatefulWidget {
  AddNewGroupScreen({Key? key}) : super(key: key);

  @override
  State<AddNewGroupScreen> createState() => _AddNewGroupScreenState();
}

class _AddNewGroupScreenState extends State<AddNewGroupScreen> {
  TextEditingController groupNameController=TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
              Container(
            height: size.height*0.16,
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
              padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.04),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios, size: 20, color: bckgrnd,)),
                     Text('Create new Group', style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontFamily: "Mbold",
                            color: bckgrnd
                        ),),
                  Container(
                    height: 10,
                    width: 10,
                  )
                ],
              ),
            ),
          ),
      Container(
                  margin: EdgeInsets.only(top: size.height * 0.14),
                  width: size.width,

        decoration: BoxDecoration(
                      color: Color(0xffF7F7F7),

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)),

        ),
        child: Form(
          key: formKey,
          child: Padding(
            padding:  EdgeInsets.only(top: size.height*0.02,left: size.width*0.04,right: size.width*0.04),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Add new Group',style: TextStyle(
                      fontFamily: 'Mbold',
                      fontSize: size.height*0.02
                    ),),
                    InkWell(
                      onTap: ()async{
                        var 
                      result =  await GroupsController().addGroup(groupNameController.text);
                        if (result['code']== 200) {
                              Globals.showToastMethod(msg: 'Record Added Successfully');
                              Navigator.pop(context);
                            } else {
                              Globals.showToastMethod(msg: 'There is something wrong');
                            }
                            setState(() {
                              
                            });
                      },
                      child: Container(
                        height: size.height*0.04,
                        width: size.width*0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color:Color(0xff48E3CF) )
                        ),
                        child: Center(
                          child: Text('save',style: TextStyle(
                          fontFamily: 'Msemibold',
                          fontSize: size.height*0.018,
                          color: Color(0xff48E3CF)
                      ),),
                        ),
                      ),
                    
                    ),
                ],),
                SizedBox(height: size.height*0.02,),
                Container(
                         height: size.height * 0.09,
                            // width: size.width * 0.8,
                          child: TextFormField(
                            controller: groupNameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(color: Colors.white),
                              ),
                              fillColor: Colors.white,
                              filled:true,
                              hintText: 'Group name', contentPadding:
                            EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                              hintStyle: TextStyle(
                                  fontSize: size.width * 0.04, color: infocolor),
                            ),
                          ),
                        ),
                
                SizedBox(height: size.height*0.01,),
                        Divider(
                          thickness: 1,
                        )
              ],
            ),
          ),
        ),
      )
        ],
      ),
    );
  }
}