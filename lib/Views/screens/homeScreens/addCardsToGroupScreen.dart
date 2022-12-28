import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/GropsController/addGroup_controller.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Views/screens/homeScreens/cardsScrens/allCards.dart';
import 'package:concard/Views/screens/homeScreens/cardsScrens/favouritescards.dart';
import 'package:concard/Views/screens/homeScreens/cardsScrens/reachedCards.dart';
import 'package:concard/Views/screens/homeScreens/cardsScrens/savedCards.dart';
import 'package:concard/Views/screens/homeScreens/contactsProfileViewScreen.dart';
import 'package:concard/Views/screens/homeScreens/notifications/notificationsScreen.dart';
import 'package:concard/Views/screens/homeScreens/personalProfileViewScreen.dart';
import 'package:concard/Views/widgets/shimmer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:concard/Constants/globals.dart' as Globals;


class AddCardsToGroupScreen extends StatefulWidget {
  AddCardsToGroupScreen({Key? key,required this.groupId,this.initialIndex}) : super(key: key);
int? groupId;
int? initialIndex;
  @override
  State<AddCardsToGroupScreen> createState() => _AddCardsToGroupScreenState();
}

String? isSelect;

class _AddCardsToGroupScreenState extends State<AddCardsToGroupScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppProvider>(builder: (context,appPro,_){
      return DefaultTabController(
      length: 4,
      initialIndex:int.parse(widget.initialIndex.toString()) ,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: size.height * 0.15,
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topCenter, colors: [signupclor_light, signupclor_dark]),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.04),
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
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Cards',
                          style: TextStyle(fontSize: size.height * 0.018, fontFamily: "MBold", color: bckgrnd),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const NotificationsScreen()));
                                      },
                                      child: Stack(
                                        children: [
                                          SvgPicture.asset(bellIcon),
                                          Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: SvgPicture.asset(notifyDot),
                                          ),
                                        ],
                                      ),
                                    ),
                                    
                                      SizedBox(
                                  width: size.width * 0.04,
                                ),
                                 GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const PersonalProfileViewScreen()));
                                  },
                                  child: CircleAvatar(
                                    radius: size.height * 0.02,
                                    backgroundImage: NetworkImage(
                                      // individualProfileModel!.profileData!.profileImage.toString(),
                                      appPro.individualProfileModel?.individualProfileDetailData!.singleProfileUser?.profileImage != null
                                          ? appPro.individualProfileModel!.individualProfileDetailData!.singleProfileUser!.profileImage.toString()
                                          : "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                    ),
                                  ),
                                ),
                               

                        ],
                      ),
                              
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.13),
                // height: size.height * 1.0,
                width: size.width,
                decoration: BoxDecoration(
                  color: btnclr,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Globals.cardListModal != null
                    ? Padding(
                        padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02, top: size.height * 0.02),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: size.width * 0.65,
                                  child: Column(
                                    children: [
                                      TabBar(
                                          labelColor: primaryblue,
                                          unselectedLabelColor: Colors.grey,
                                          indicatorColor: btnclr,
                                          // labelStyle: ,
                                          isScrollable: true,
                                          tabs: [
                                            Text(
                                              'All Cards (${Globals.cardListModal!.cardListData!.allCardsCounts.toString()})',
                                              style: TextStyle(),
                                            ),
                                            Text(
                                              'Reached Concards (${Globals.cardListModal!.cardListData!.reachedCardsCounts.toString()})',
                                              style: TextStyle(),
                                            ),
                                            Text(
                                              'Favourites (${Globals.cardListModal!.cardListData!.favouriteCardsCounts.toString()})',
                                              style: TextStyle(),
                                            ),
                                            Text(
                                              'Saved Concards (${Globals.cardListModal!.cardListData!.savedCardsCounts.toString()})',
                                              style: TextStyle(),
                                            ),
                                          ]),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.035,
                                  width: size.width * 0.2,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        gradientgreen,
                                        primarygreen,
                                      ],
                                    ),
                                    color: bckgrnd,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: GestureDetector(
                                    onTap: () async{
                                   
                                    await GroupsController().addCardToGroup(widget.groupId.toString(), Globals.cardListModal!.cardListData!.cards![0].id.toString());
                                   Navigator.pop(context);
                                    setState(() {
                                      
                                    });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Add',
                                        style: TextStyle(color: bckgrnd, fontSize: size.height * 0.015, fontFamily: 'Msemibold'),
                                      ),
                                    ),
                                  ),
                                ),
                                
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Container(
                              height: size.height,
                              child: TabBarView(
                                children: [
                                  AllCards(isRadio: true,),
                                  ReachedCardsScreen(),
                                  FavouritesScreen(),
                                  SavedCards(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ShimmerLoadWidget(),

              ),
            ],
          ),
        ),
      ),
    );
  
    });
  
  }
}
