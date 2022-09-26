import 'dart:developer';

import 'package:comment_tree/comment_tree.dart';
import 'package:concard/Constants/colors.dart';
import 'package:concard/Constants/images.dart';
import 'package:concard/Controllers/compnayControllers/postController.dart';
import 'package:concard/Controllers/providers/app_providers.dart';
import 'package:concard/Models/post_list_modal.dart';
import 'package:concard/Views/screens/homeScreens/drawerMenuScreen.dart';
import 'package:concard/Views/screens/homeScreens/notifications/notificationsScreen.dart';
import 'package:concard/Views/screens/homeScreens/personalProfileViewScreen.dart';
import 'package:concard/Views/screens/homeScreens/searchScreens/searchScreen.dart';
import 'package:concard/Views/widgets/show_full_screen_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool hide = false;
  bool likeIndex = false;
  bool commentIndex = false;
  bool shareIndex = false;
  bool isLike = false;
  bool isSelected = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var commentController = TextEditingController();
  // PostsListModal? postsListModal;
  // Future<PostsListModal?> getPostsList() async {
  //   postsListModal = await PostController().getPostList();
  //   setState(() {});
  //   return postsListModal;

  // }
  List<int>? isLikeList = [];
  AppProvider? appPro;
  @override
  void initState() {
    // getPostsList();
    appPro = Provider.of<AppProvider>(context, listen: false);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      // bottomNavigationBar: BottomNavigationScreen(),
      drawer: DrawerMenuScreen(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
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
                            onTap: () =>
                                _scaffoldKey.currentState!.openDrawer(),
                            child: Image.asset(
                              more_icon,
                              height: size.height * 0.03,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const SearchScreen()));
                                },
                                child: Image.asset(
                                  srch_icon,
                                  height: size.height * 0.04,
                                )),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const NotificationsScreen()));
                                },
                                child: Image.asset(
                                  notify_icon,
                                  height: size.height * 0.04,
                                )),
                            SizedBox(
                              width: size.width * 0.04,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const PersonalProfileViewScreen()));
                              },
                              child: CircleAvatar(
                                  radius: size.height * 0.02,
                                  backgroundImage: NetworkImage(
                                    appPro!.indiviualProfileModel!=null?appPro!.indiviualProfileModel!.profileData!
                                            .image ??
                                        "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg":"https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                  )),
                            ),
                            SizedBox(
                              width: size.height * 0.01,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.13),
              height: size.height * 0.9,
              width: size.width,
              decoration: BoxDecoration(
                  color: btnclr,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )),
              child: Column(
                children: [
                  Container(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Container(
                            child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(walimg)),
                            margin: EdgeInsets.only(left: size.width * 0.02),
                          );
                        }),
                    margin: EdgeInsets.only(
                      top: size.height * 0.01,
                    ),
                    height: size.height * 0.1,
                    width: size.width * 0.9,
                  ),
                  // postsListModal != null
                  //     ?
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    // color: Colors.red,
                    child:
                        //  postsListModal!.posts!.isNotEmpty
                        //     ?
                        FutureBuilder<PostsListModal?>(
                            future: PostController().getPostList(),
                            builder: (context, snapshot) {
                              if (snapshot.data != null) {
                                var postData = snapshot.data;
                                var posts = snapshot.data!.posts;

                                for (var isLike in posts!) {
                                  isLikeList!.add(isLike.userLike!);
                                }
                                return ListView.builder(
                                    padding: const EdgeInsets.all(0),
                                    scrollDirection: Axis.vertical,
                                    itemCount: posts.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),

                                        // height: size.height * 0.43,
                                        width: size.width * 0.9,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: size.width * 0.02,
                                                  top: size.height * 0.02,
                                                  right: size.width * 0.02),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage: NetworkImage(
                                                          '${posts[index].user!.image}')),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${posts[index].user!.firstName} ${posts[index].user!.lastName}',
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.015,
                                                            fontFamily:
                                                                "MBold"),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            size.height * 0.003,
                                                      ),
                                                      Text(
                                                        '${posts[index].user!.email}',
                                                        style: TextStyle(
                                                            fontSize:
                                                                size.height *
                                                                    0.015,
                                                            fontFamily: "Stf"),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            DateTime.now()
                                                                    .difference(
                                                                        DateTime.parse(
                                                                            posts[index].createdAt!))
                                                                    .inHours
                                                                    .toString() +
                                                                " h ago",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    size.height *
                                                                        0.015,
                                                                color:
                                                                    infocolor,
                                                                fontFamily:
                                                                    "Msemibold"),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                size.height *
                                                                    0.02,
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                isSelected =
                                                                    !isSelected;
                                                              });
                                                            },
                                                            child: Container(
                                                              height:
                                                                  size.height *
                                                                      0.03,
                                                              width:
                                                                  size.width *
                                                                      0.23,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              signupclor_dark)),
                                                              child: Padding(
                                                                padding: EdgeInsets.only(
                                                                    left: size
                                                                            .width *
                                                                        0.05,
                                                                    right: size
                                                                            .width *
                                                                        0.01),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      isSelected
                                                                          ? 'Added'
                                                                          : 'Add',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Msemibold",
                                                                          fontSize: size.height *
                                                                              0.015,
                                                                          color:
                                                                              signupclor_dark),
                                                                    ),
                                                                    Icon(
                                                                      isSelected
                                                                          ? Icons
                                                                              .check
                                                                          : Icons
                                                                              .add,
                                                                      size: size
                                                                              .height *
                                                                          0.02,
                                                                      color:
                                                                          signupclor_dark,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),

                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            (posts[index].text == null ||
                                                    posts[index].text == "")
                                                ? const SizedBox(
                                                    height: 0,
                                                  )
                                                : Text(posts[index]
                                                    .text
                                                    .toString()),
                                            (posts[index].image == null ||
                                                    posts[index].image == "")
                                                ? const SizedBox(
                                                    height: 0,
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ShowFullScreenImage(
                                                                    images: [
                                                                      posts[index]
                                                                          .image!
                                                                    ],
                                                                  )));
                                                    },
                                                    child: ClipRRect(
                                                      child: Image.network(
                                                        "${posts[index].image}",
                                                        height:
                                                            size.height * 0.25,
                                                        width: size.width * 0.8,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),

                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: size.width * 0.04,
                                                  right: size.width * 0.04,
                                                  top: size.height * 0.015),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      if (isLikeList![index] ==
                                                          1) {
                                                        isLikeList!
                                                            .insert(index, 0);
                                                      } else {
                                                        isLikeList!
                                                            .insert(index, 1);
                                                      }
                                                      setState(() {});
                                                      var result =
                                                          await PostController()
                                                              .addPostLike(
                                                                  posts[index]
                                                                      .id
                                                                      .toString(),
                                                                  isLikeList![
                                                                          index]
                                                                      .toString());
                                                      if (result['code'] ==
                                                          200) {
                                                        setState(() {});
                                                      }
                                                      // setState(() {
                                                      //   likeIndex = !likeIndex;
                                                      // });
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Image.asset(like_icon,
                                                            height:
                                                                size.height *
                                                                    0.025,
                                                            color: isLikeList![
                                                                        index] ==
                                                                    1
                                                                ? signupclor_dark
                                                                : infocolor),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.02,
                                                        ),
                                                        Text(
                                                          'Like (${posts[index].likeCounts})',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  size.height *
                                                                      0.015,
                                                              fontFamily:
                                                                  "Msemibold",
                                                              color: isLikeList![
                                                                          index] ==
                                                                      1
                                                                  ? signupclor_dark
                                                                  : infocolor),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      _commentsModalBottomSheet(
                                                        context,
                                                        posts[index],
                                                      );
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          comment_icon,
                                                          height: size.height *
                                                              0.025,
                                                          color: infocolor,
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.02,
                                                        ),
                                                        Text(
                                                          'Comment (${posts[index].comments!.length})',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  size.height *
                                                                      0.015,
                                                              fontFamily:
                                                                  "Msemibold",
                                                              color: infocolor),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Share.share(
                                                          'https://www.apple.com/app-store/',
                                                          subject:
                                                              'Share this app with you friends.');
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Image.asset(
                                                          shareicon,
                                                          height: size.height *
                                                              0.025,
                                                          color: infocolor,
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.02,
                                                        ),
                                                        Text(
                                                          'Share',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  size.height *
                                                                      0.015,
                                                              fontFamily:
                                                                  "Msemibold",
                                                              color: infocolor),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Divider(
                                            //   thickness: 1,
                                            //   indent: 15,
                                            //   endIndent: 15,
                                            // ),
                                          ],
                                        ),
                                        margin:
                                            const EdgeInsets.only(bottom: 10),
                                        padding: const EdgeInsets.all(10),
                                      );
                                    });
                              } else {
                                return Center(
                                  child:
                                      SpinKitChasingDots(color: primarygreen),
                                );
                              }
                              // if (snapshot.connectionState ==
                              //     ConnectionState.done) {
                              //   if (snapshot.hasError) {
                              //     return const Center(
                              //       child: Text("Something went wrong"),
                              //     );
                              //   } else if (snapshot.data!.posts!.isEmpty) {
                              //     return const Center(
                              //       child: Text("There is no post yet"),
                              //     );
                              //   } else if (snapshot.hasData) {
                              //     var postData = snapshot.data;
                              //     return ListView.builder(
                              //         padding: const EdgeInsets.all(0),
                              //         scrollDirection: Axis.vertical,
                              //         itemCount: postData!.posts!.length,
                              //         itemBuilder: (context, index) {
                              //           return Container(
                              //             decoration: BoxDecoration(
                              //                 color: Colors.white,
                              //                 borderRadius:
                              //                     BorderRadius.circular(10)),

                              //             // height: size.height * 0.43,
                              //             width: size.width * 0.9,
                              //             child: Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 Padding(
                              //                   padding: EdgeInsets.only(
                              //                       left: size.width * 0.02,
                              //                       top: size.height * 0.02,
                              //                       right: size.width * 0.02),
                              //                   child: Row(
                              //                     crossAxisAlignment:
                              //                         CrossAxisAlignment.start,
                              //                     children: [
                              //                       CircleAvatar(
                              //                           radius: 20,
                              //                           backgroundImage:
                              //                               NetworkImage(
                              //                                   '${posts![index].user!.image}')),
                              //                       const SizedBox(
                              //                         width: 10,
                              //                       ),
                              //                       Column(
                              //                         crossAxisAlignment:
                              //                             CrossAxisAlignment
                              //                                 .start,
                              //                         children: [
                              //                           Text(
                              //                             '${posts![index].user!.firstName} ${posts![index].user!.lastName}',
                              //                             style: TextStyle(
                              //                                 fontSize:
                              //                                     size.height *
                              //                                         0.015,
                              //                                 fontFamily:
                              //                                     "MBold"),
                              //                           ),
                              //                           SizedBox(
                              //                             height: size.height *
                              //                                 0.003,
                              //                           ),
                              //                           Text(
                              //                             '${posts![index].user!.email}',
                              //                             style: TextStyle(
                              //                                 fontSize:
                              //                                     size.height *
                              //                                         0.015,
                              //                                 fontFamily:
                              //                                     "Stf"),
                              //                           ),
                              //                         ],
                              //                       ),
                              //                       const Spacer(),
                              //                       Row(
                              //                         children: [
                              //                           Column(
                              //                             crossAxisAlignment:
                              //                                 CrossAxisAlignment
                              //                                     .end,
                              //                             children: [
                              //                               Text(
                              //                                 DateTime.now()
                              //                                         .difference(DateTime.parse(postData
                              //                                             .posts![
                              //                                                 index]
                              //                                             .createdAt!))
                              //                                         .inHours
                              //                                         .toString() +
                              //                                     " h ago",
                              //                                 style: TextStyle(
                              //                                     fontSize:
                              //                                         size.height *
                              //                                             0.015,
                              //                                     color:
                              //                                         infocolor,
                              //                                     fontFamily:
                              //                                         "Msemibold"),
                              //                               ),
                              //                               SizedBox(
                              //                                 height:
                              //                                     size.height *
                              //                                         0.02,
                              //                               ),
                              //                               InkWell(
                              //                                 onTap: () {
                              //                                   setState(() {
                              //                                     isSelected =
                              //                                         !isSelected;
                              //                                   });
                              //                                 },
                              //                                 child: Container(
                              //                                   height:
                              //                                       size.height *
                              //                                           0.03,
                              //                                   width:
                              //                                       size.width *
                              //                                           0.23,
                              //                                   decoration: BoxDecoration(
                              //                                       borderRadius:
                              //                                           BorderRadius.circular(
                              //                                               30),
                              //                                       border: Border.all(
                              //                                           color:
                              //                                               signupclor_dark)),
                              //                                   child: Padding(
                              //                                     padding: EdgeInsets.only(
                              //                                         left: size
                              //                                                 .width *
                              //                                             0.05,
                              //                                         right: size
                              //                                                 .width *
                              //                                             0.01),
                              //                                     child: Row(
                              //                                       mainAxisAlignment:
                              //                                           MainAxisAlignment
                              //                                               .spaceBetween,
                              //                                       children: [
                              //                                         Text(
                              //                                           isSelected
                              //                                               ? 'Added'
                              //                                               : 'Add',
                              //                                           style: TextStyle(
                              //                                               fontFamily:
                              //                                                   "Msemibold",
                              //                                               fontSize: size.height *
                              //                                                   0.015,
                              //                                               color:
                              //                                                   signupclor_dark),
                              //                                         ),
                              //                                         Icon(
                              //                                           isSelected
                              //                                               ? Icons.check
                              //                                               : Icons.add,
                              //                                           size: size.height *
                              //                                               0.02,
                              //                                           color:
                              //                                               signupclor_dark,
                              //                                         )
                              //                                       ],
                              //                                     ),
                              //                                   ),
                              //                                 ),
                              //                               )
                              //                             ],
                              //                           ),
                              //                         ],
                              //                       ),
                              //                       const SizedBox(
                              //                         width: 5,
                              //                       )
                              //                     ],
                              //                   ),
                              //                 ),
                              //                 const SizedBox(
                              //                   height: 15,
                              //                 ),

                              //                 SizedBox(
                              //                   height: size.height * 0.01,
                              //                 ),
                              //                 (posts![index].text ==
                              //                             null ||
                              //                         posts![index]
                              //                                 .text ==
                              //                             "")
                              //                     ? const SizedBox(
                              //                         height: 0,
                              //                       )
                              //                     : Text(postData
                              //                         .posts![index].text
                              //                         .toString()),
                              //                 (posts![index].image ==
                              //                             null ||
                              //                         posts![index]
                              //                                 .image ==
                              //                             "")
                              //                     ? const SizedBox(
                              //                         height: 0,
                              //                       )
                              //                     : InkWell(
                              //                         onTap: () {
                              //                           Navigator.push(
                              //                               context,
                              //                               MaterialPageRoute(
                              //                                   builder:
                              //                                       (context) =>
                              //                                           ShowFullScreenImage(
                              //                                             images: [
                              //                                               posts![index].image!
                              //                                             ],
                              //                                           )));
                              //                         },
                              //                         child: ClipRRect(
                              //                           child: Image.network(
                              //                             "${posts![index].image}",
                              //                             height: size.height *
                              //                                 0.25,
                              //                             width:
                              //                                 size.width * 0.8,
                              //                             fit: BoxFit.cover,
                              //                           ),
                              //                           borderRadius:
                              //                               BorderRadius
                              //                                   .circular(10),
                              //                         ),
                              //                       ),

                              //                 Padding(
                              //                   padding: EdgeInsets.only(
                              //                       left: size.width * 0.04,
                              //                       right: size.width * 0.04,
                              //                       top: size.height * 0.015),
                              //                   child: Row(
                              //                     mainAxisAlignment:
                              //                         MainAxisAlignment
                              //                             .spaceBetween,
                              //                     children: [
                              //                       InkWell(
                              //                         onTap: () async {
                              //                           log(postData
                              //                               .posts![index].id
                              //                               .toString());
                              //                           print("like:" +
                              //                               postData
                              //                                   .posts![index]
                              //                                   .userLike
                              //                                   .toString());
                              //                           // if (postData
                              //                           //         .posts![index]
                              //                           //         .userLike ==
                              //                           //     0) {
                              //                           //   posts![index]
                              //                           //           .userLike !=
                              //                           //       1;
                              //                           //   setState(() {});
                              //                           // } else {
                              //                           //   posts![index]
                              //                           //           .userLike !=
                              //                           //       0;
                              //                           //   setState(() {});
                              //                           // }
                              //                           var result = await PostController()
                              //                               .addPostLike(
                              //                                   postData
                              //                                       .posts![
                              //                                           index]
                              //                                       .id
                              //                                       .toString(),
                              //                                   posts![index]
                              //                                               .userLike ==
                              //                                           1
                              //                                       ? "0"
                              //                                       : "1");
                              //                           if (result['code'] ==
                              //                               200) {
                              //                             setState(() {});
                              //                           }
                              //                           setState(() {
                              //                             likeIndex =
                              //                                 !likeIndex;
                              //                           });
                              //                         },
                              //                         child: Row(
                              //                           children: [
                              //                             Image.asset(like_icon,
                              //                                 height:
                              //                                     size.height *
                              //                                         0.025,
                              //                                 color: postData
                              //                                             .posts![
                              //                                                 index]
                              //                                             .userLike ==
                              //                                         1
                              //                                     ? signupclor_dark
                              //                                     : infocolor),
                              //                             SizedBox(
                              //                               width: size.width *
                              //                                   0.02,
                              //                             ),
                              //                             Text(
                              //                               'Like (${posts![index].likeCounts})',
                              //                               style: TextStyle(
                              //                                   fontSize:
                              //                                       size.height *
                              //                                           0.015,
                              //                                   fontFamily:
                              //                                       "Msemibold",
                              //                                   color: postData
                              //                                               .posts![index]
                              //                                               .userLike ==
                              //                                           1
                              //                                       ? signupclor_dark
                              //                                       : infocolor),
                              //                             ),
                              //                           ],
                              //                         ),
                              //                       ),
                              //                       InkWell(
                              //                         onTap: () {},
                              //                         child: Row(
                              //                           children: [
                              //                             Image.asset(
                              //                               comment_icon,
                              //                               height:
                              //                                   size.height *
                              //                                       0.025,
                              //                               color: infocolor,
                              //                             ),
                              //                             SizedBox(
                              //                               width: size.width *
                              //                                   0.02,
                              //                             ),
                              //                             Text(
                              //                               'Comment (${posts![index].comments!.length})',
                              //                               style: TextStyle(
                              //                                   fontSize:
                              //                                       size.height *
                              //                                           0.015,
                              //                                   fontFamily:
                              //                                       "Msemibold",
                              //                                   color:
                              //                                       infocolor),
                              //                             ),
                              //                           ],
                              //                         ),
                              //                       ),
                              //                       InkWell(
                              //                         onTap: () {},
                              //                         child: Row(
                              //                           children: [
                              //                             Image.asset(
                              //                               shareicon,
                              //                               height:
                              //                                   size.height *
                              //                                       0.025,
                              //                               color: infocolor,
                              //                             ),
                              //                             SizedBox(
                              //                               width: size.width *
                              //                                   0.02,
                              //                             ),
                              //                             Text(
                              //                               'Share',
                              //                               style: TextStyle(
                              //                                   fontSize:
                              //                                       size.height *
                              //                                           0.015,
                              //                                   fontFamily:
                              //                                       "Msemibold",
                              //                                   color:
                              //                                       infocolor),
                              //                             ),
                              //                           ],
                              //                         ),
                              //                       ),
                              //                     ],
                              //                   ),
                              //                 ),
                              //                 // Divider(
                              //                 //   thickness: 1,
                              //                 //   indent: 15,
                              //                 //   endIndent: 15,
                              //                 // ),
                              //               ],
                              //             ),
                              //             margin:
                              //                 const EdgeInsets.only(bottom: 10),
                              //             padding: const EdgeInsets.all(10),
                              //           );
                              //         });
                              //   }
                              // }
                              // return Text("");
                            })
                    // : const Center(
                    //     child: Text("No post available yet"),
                    //   ),
                    ,
                    margin: const EdgeInsets.only(
                      top: 5,
                    ),
                    height: size.height * 0.67,
                    width: size.width * 0.9,
                  )
                  // : Center(child: SpinKitFadingCube(color: primarygreen)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool? isprofile = false;
  bool? isSendBtn = false;
  bool? isShow = false;
  void _commentsModalBottomSheet(
    context,
    Posts? singlePost,
  ) {
    var size = MediaQuery.of(context).size;
    List<Comment> childReplies = [];
    List<Comment> parentComments = [];
    List<Comments>? comments = singlePost!.comments;
    var commentsList = [];
    var repliesApiList = [];
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Scaffold(body: StatefulBuilder(
            builder: ((context, setStat) {
              return Container(
                  // height:size.height*.8,
                  padding: const EdgeInsets.only(top: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.02,
                          right: size.width * 0.02,
                          top: size.height * 0.02),
                      child: Column(
                        children: [
                          comments!.isNotEmpty
                              ? SizedBox(
                                  height: size.height * 0.85,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.all(0),
                                    itemCount: comments.length,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      commentsList = comments;
                                      parentComments.clear();
                                      childReplies.clear();
                                      repliesApiList =
                                          commentsList[index].replies;
                                      for (var comment in commentsList) {
                                        parentComments.add(Comment(
                                            avatar: comment.user!.image,
                                            userName: comment.user!.firstName,
                                            content: comment.text));
                                      }
                                      for (var subComment in repliesApiList) {
                                        childReplies.add(Comment(
                                            avatar: subComment.user!.image,
                                            userName:
                                                subComment.user!.firstName,
                                            content: subComment.text));
                                      }

                                      return CommentTreeWidget<Comment,
                                          Comment>(
                                        Comment(
                                            avatar:
                                                '${parentComments[index].avatar}',
                                            userName:
                                                '${parentComments[index].userName}',
                                            content:
                                                '${parentComments[index].content}'),
                                        childReplies,
                                        treeThemeData: const TreeThemeData(
                                            lineColor: Colors.grey,
                                            lineWidth: 3),
                                        avatarRoot: (context, data) =>
                                            PreferredSize(
                                                child: CircleAvatar(
                                                  radius: 18,
                                                  backgroundColor: Colors.grey,
                                                  backgroundImage: NetworkImage(
                                                      data.avatar!),
                                                ),
                                                preferredSize:
                                                    const Size.fromRadius(18)),
                                        avatarChild: (context, data) =>
                                            PreferredSize(
                                                child: CircleAvatar(
                                                  radius: 12,
                                                  backgroundColor: Colors.grey,
                                                  backgroundImage: NetworkImage(
                                                      data.avatar!),
                                                ),
                                                preferredSize:
                                                    Size.fromRadius(12)),
                                        contentChild: (context, data) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: size.width * 0.02,
                                                      top: size.height * 0.01,
                                                      right: size.width * 0.02,
                                                      bottom:
                                                          size.height * 0.02),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${data.userName}',
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        '${data.content}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption
                                                            ?.copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              DefaultTextStyle(
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 4),
                                                    child: Row(
                                                      children: const [
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text('3h'),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text('Like'),
                                                        SizedBox(
                                                          width: 24,
                                                        ),
                                                        Text('Reply'),
                                                      ],
                                                    ),
                                                  ))
                                            ],
                                          );
                                        },
                                        contentRoot: (context, data) {
                                          return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 8,
                                                      horizontal: 8),
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[100],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${data.userName}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        '${data.content}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                DefaultTextStyle(
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                          color:
                                                              Colors.grey[700],
                                                          fontWeight:
                                                              FontWeight.bold),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top:
                                                            size.height * 0.02),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.03,
                                                        ),
                                                        Text(
                                                          '3h',
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize:
                                                                size.height *
                                                                    0.018,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.03,
                                                        ),
                                                        Text('Like'),
                                                        SizedBox(
                                                          width:
                                                              size.width * 0.03,
                                                        ),
                                                        Text('Reply'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ]);
                                        },
                                      );
                                    },
                                  ),
                                )
                              : const Center(child: Text("No Comments here")),
                          // comments.isNotEmpty?const SizedBox(height: 0,):,
                          Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: size.height * 0.03,
                                    backgroundImage: const NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsK6oIKzeSCKiqpjv5cuoC4ZC_hJ0FxNkvQ&usqp=CAU"),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.04,
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: TextFormField(
                                        controller: commentController,

                                        textInputAction: TextInputAction.done,
                                        // onEditingComplete: () {
                                        //   print("on compl");
                                        //   FocusScopeNode? currentFocus =
                                        //       FocusScope.of(context);
                                        //   if (!currentFocus.hasPrimaryFocus) {
                                        //     currentFocus.unfocus();
                                        //     setState(() {
                                        //       isOpen = false;
                                        //     });
                                        //   }
                                        // },
                                        // onFieldSubmitted: (String? value){
                                        //   print("on submitted");
                                        // },
                                        decoration: InputDecoration(
                                            fillColor:
                                                Colors.grey.withOpacity(0.2),
                                            filled: true,
                                            suffixIcon: InkWell(
                                                onTap: () async {
                                                  // Navigator.pop(context);
                                                  parentComments.add(Comment(
                                                      avatar: '',
                                                      userName: 'Umar',
                                                      content: commentController
                                                          .text
                                                          .trim()));

                                                  await PostController()
                                                      .addPostComment(
                                                          singlePost.id
                                                              .toString(),
                                                          commentController.text
                                                              .trim());
                                                  setStat(() {
                                                    setState(() {});
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.send,
                                                  size: size.height * 0.03,
                                                  color: signupclor_light,
                                                )),
                                            hintText: 'Write your comment',
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 0.0,
                                                    left: 22.0,
                                                    bottom: 2.0),
                                            hintStyle: TextStyle(
                                                fontSize: size.width * 0.04,
                                                color: infocolor),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
            }),
          ));
        });
  }
}
