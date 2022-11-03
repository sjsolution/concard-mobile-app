import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:comment_tree/comment_tree.dart';
import 'package:provider/provider.dart';
import 'package:concard/Controllers/indiviualController/follow_controller.dart';
import 'package:concard/Views/widgets/imagePickerWidget.dart';
import 'package:concard/Controllers/storyController/story_controller.dart';
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
import 'package:share_plus/share_plus.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:concard/Views/screens/story_view.dart';
import '../../../Controllers/OthersController/date_time.dart';
import '../../../Controllers/OthersController/image_picker_controller.dart';
import '../../../Controllers/providers/story_provider.dart';
import '../../../Models/Indiviuals/profile_model.dart';
import '../text_status_add.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:concard/Controllers/indiviualController/profile_controller.dart';

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

  IndividualProfileModel? individualProfileModel;

//   getStoriesList() async {
//     // Globals.followingListModal =
//     //     await FollowingController().getFollowingRequest(Globals.userId);
//     Globals.storyModel = await StoryController().getStories();
//     appPro = Provider.of<AppProvider>(context, listen: false);
//     individualProfileModel = appPro!.individualProfileModel;
//     print("indi prof model");
//     print(individualProfileModel?.profileData?.profileImage);
// // print('follow id \n'+Globals.followingListModal!.data![0].firstName.toString());
//     // print('added to followers................\n' +Globals!.uderId.Globals.followingListModal!.data.toString());
//     setState(() {});
//   }

  List<int>? isPostLikeList = [];
  // List<int>? = [];
  List<int>? isCommentLikeList = [];
  AppProvider? appPro;
  StoryProvider? storyProvider1;
  @override
  void initState() {
    // getStoriesList();
    fetchStoriesList();
    super.initState();
  }

  fetchStoriesList() async {
    Provider.of<StoryProvider>(context, listen: false).getStories();
    individualProfileModel = await ProfileController().getIndiviualProfile(Globals.id, context);
    Provider.of<AppProvider>(context, listen: false).setIndividualProfileModelProfileObj = individualProfileModel;
    appPro = Provider.of<AppProvider>(context, listen: false);
    // debugPrint(individualProfileModel?.data?.user?.profileImage);
    // print('model_______________________');
    // print(context.read<StoryProvider>().storyProvider?.data);
    // print(individualProfileModel?.profileData?.profileImage);
  }

  File? uploadProfile;

  _openBottomSheet() async {
    getImageType(
      context,
      () async {
        Navigator.pop(context);
        uploadProfile = await ImagePickerMethods().getImage(ImageSource.gallery);
        if (uploadProfile != null) {
          debugPrint(uploadProfile.toString());
          await StoryController().addStory(file: uploadProfile);
        }
        if (mounted) {
          setState(() {});
        }
      },
      () async {
        Navigator.pop(context);
        uploadProfile = await ImagePickerMethods().getImage(ImageSource.camera);
        if (uploadProfile != null) {
          debugPrint(uploadProfile.toString());
          await StoryController().addStory(file: uploadProfile);
          StoryProvider().getStories();
        }
        if (mounted) {
          setState(() {});
        }
      },
      true,
      () {
        debugPrint("1");
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => TextStatusAdd()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
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
                        gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topCenter, colors: [signupclor_light, signupclor_dark]),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => _scaffoldKey.currentState!.openDrawer(),
                              child: Image.asset(
                                more_icon,
                                height: size.height * 0.03,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SearchScreen()));
                                    },
                                    child: SvgPicture.asset(srchIcon)),
                                SizedBox(
                                  width: size.width * 0.04,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const NotificationsScreen()));
                                  },
                                  child: Image.asset(
                                    notify_icon,
                                    height: size.height * 0.04,
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
                                      appPro?.individualProfileModel?.data?.user?.profileImage.toString() != null
                                          ? appPro!.individualProfileModel!.data!.user!.profileImage.toString()
                                          : "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                    ),
                                  ),
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
                      // Container(
                      //   height: 10,
                      //   width: 50,
                      //   color: Colors.black,
                      // ),
                      // Story Line
                      Consumer<StoryProvider>(
                        builder: (context, storyProvider, child) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _openBottomSheet();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    left: size.width * 0.02,
                                    top: size.height * 0.01,
                                  ),
                                  height: size.height * 0.07,
                                  width: size.height * 0.07,
                                  child: Stack(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          appPro?.individualProfileModel?.data?.user?.profileImage != null
                                              ? appPro!.individualProfileModel!.data!.user!.profileImage.toString()
                                              : "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg",
                                        ),
                                        radius: 28,
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Colors.white,
                                          child: Center(
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Globals.storyModel != null
                                  ? Container(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(0),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: Globals.storyModel!.data!.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => StoryViewClass(
                                                    profilePicture: Globals.storyModel!.data![index].profileImage.toString(),
                                                    name:
                                                        "${Globals.storyModel!.data![index].firstName.toString()} ${Globals.storyModel!.data![index].lastName.toString()}",
                                                    stories: Globals.storyModel!.data![index].stories!,
                                                  ),
                                                ),
                                              ),
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                  right: size.height * 0.01,
                                                ),
                                                child: CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: NetworkImage(
                                                    Globals.storyModel != null
                                                        ? Globals.storyModel!.data![index].profileImage.toString()
                                                        : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRA_RhLhMFQptcSkzBWhnq13UqR12y7mXuSVw&usqp=CAU',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      margin: EdgeInsets.only(
                                        top: size.height * 0.01,
                                      ),
                                      height: size.height * 0.1,
                                      // width: size.width * 0.9,
                                    )
                                  : const SizedBox(),
                            ],
                          );
                        },
                      ),
                      // Container(
                      //   height: 10,
                      //   width: 50,
                      //   color: Colors.black,
                      // ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        // color: Colors.red,
                        child:
                            //  postsListModal!.posts!.isNotEmpty
                            //     ?
                            FutureBuilder<PostsListModal?>(
                          future: Future.delayed(
                            Duration(seconds: 1),
                            () => PostController().getPostList(),
                          ),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              // var postData = snapshot.data;
                              var posts = snapshot.data!.data;

                              for (var isLike in posts!) {
                                isPostLikeList!.add(isLike.userLike!);
                              }
                              return ListView.builder(
                                padding: const EdgeInsets.all(0),
                                scrollDirection: Axis.vertical,
                                itemCount: posts.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),

                                    // height: size.height * 0.43,
                                    width: size.width * 0.9,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: size.width * 0.02, top: size.height * 0.02, right: size.width * 0.02),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundImage: NetworkImage('${posts[index].user!.logo.toString()}'),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${posts[index].user!.firstName} ${posts[index].user!.lastName}',
                                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "MBold"),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.003,
                                                  ),
                                                  Text(
                                                    '${posts[index].user!.email}',
                                                    style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Stf"),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        DateTimeManueplate()
                                                            .giveDifferenceInTime(DateTime.parse(posts[index].createdAt!.toString()))!,
                                                        style: TextStyle(fontSize: size.height * 0.015, color: infocolor, fontFamily: "Msemibold"),
                                                      ),
                                                      SizedBox(
                                                        height: size.height * 0.02,
                                                      ),
                                                      Globals.userId == posts[index].userId
                                                          ? SizedBox()
                                                          : InkWell(
                                                              onTap: () {
                                                                // print();
                                                                // FollowController().sendFollowRequest(followRequest['following_id']);
                                                                // appPro!.sendFollowRequest(id: posts[index].userId.toString());
                                                                // if (appPro!.isFollowing == 0) {
                                                                //   posts[index].isFollowed = 1;
                                                                // } else if (posts[index].isFollowed == 1) {
                                                                //   posts[index].isFollowed = 0;
                                                                // }
                                                                // setState(() {});
                                                                FollowController().sendFollowRequest(id: posts[index].userId.toString());
                                                                setState((){});
                                                              },
                                                              child: Container(
                                                                height: size.height * 0.03,
                                                                width: size.width * 0.23,
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(30),
                                                                    border: Border.all(color: signupclor_dark)),
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.01),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        posts[index].isFollowed == 1 ? 'Added' : 'Add',
                                                                        style: TextStyle(
                                                                            fontFamily: "Msemibold",
                                                                            fontSize: size.height * 0.015,
                                                                            color: signupclor_dark),
                                                                      ),
                                                                      Icon(
                                                                        posts[index].isFollowed == 1 ? Icons.check : Icons.add,
                                                                        size: size.height * 0.02,
                                                                        color: signupclor_dark,
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
                                        (posts[index].text == null || posts[index].text == "")
                                            ? const SizedBox(
                                                height: 0,
                                              )
                                            : Text(posts[index].text.toString()),
                                        (posts[index].image == null || posts[index].image == "")
                                            ? const SizedBox(
                                                height: 0,
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => ShowFullScreenImage(
                                                                images: [posts[index].image!],
                                                              )));
                                                },
                                                child: ClipRRect(
                                                  child: Image.network(
                                                    "${posts[index].image}",
                                                    height: size.height * 0.25,
                                                    width: size.width * 0.8,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                              ),

                                        Padding(
                                          padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.height * 0.015),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  if (isPostLikeList![index] == 1) {
                                                    isPostLikeList![index] = 0;
                                                  } else {
                                                    isPostLikeList![index] = 1;
                                                  }
                                                  setState(() {});
                                                  var result = await PostController().addPostLike(
                                                    posts[index].id.toString(),
                                                    // isLikeList![
                                                    //         index]
                                                    //     .toString()
                                                  );

                                                  if (result['code'] == 200) {
                                                    setState(() {});
                                                  }
                                                  // setState(() {
                                                  //   likeIndex = !likeIndex;
                                                  // });
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(like_icon,
                                                        height: size.height * 0.025,
                                                        color: isPostLikeList![index] == 1 ? signupclor_dark : infocolor),
                                                    SizedBox(
                                                      width: size.width * 0.02,
                                                    ),
                                                    Text(
                                                      'Like (${posts[index].likeCounts})',
                                                      style: TextStyle(
                                                          fontSize: size.height * 0.015,
                                                          fontFamily: "Msemibold",
                                                          color: isPostLikeList![index] == 1 ? signupclor_dark : infocolor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  provider.commentsSetter = posts[index].comments;
                                                  _commentsModalBottomSheet(
                                                    context,
                                                    posts[index],
                                                  );
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      comment_icon,
                                                      height: size.height * 0.025,
                                                      color: infocolor,
                                                    ),
                                                    SizedBox(
                                                      width: size.width * 0.02,
                                                    ),
                                                    Text(
                                                      'Comment (${posts[index].comments!.length})',
                                                      style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold", color: infocolor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Share.share('https://www.apple.com/app-store/', subject: 'Share this app with you friends.');
                                                },
                                                child: Row(
                                                  children: [
                                                    Image.asset(
                                                      shareicon,
                                                      height: size.height * 0.025,
                                                      color: infocolor,
                                                    ),
                                                    SizedBox(
                                                      width: size.width * 0.02,
                                                    ),
                                                    Text(
                                                      'Share',
                                                      style: TextStyle(fontSize: size.height * 0.015, fontFamily: "Msemibold", color: infocolor),
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
                                    margin: const EdgeInsets.only(bottom: 10),
                                    padding: const EdgeInsets.all(10),
                                  );
                                },
                              );
                            } else {
                              return Center(
                                child: SpinKitChasingDots(color: primarygreen),
                              );
                            }
                          },
                        ),
                        margin: const EdgeInsets.only(
                          top: 5,
                        ),
                        height: size.height * 0.67,
                        width: size.width * 0.9,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool? isProfile = false;
  bool? isSendBtn = false;
  bool? isShow = false;
  bool isReplying = false;
  String? replyingId;

  List<Comment> childReplies = [];
  List<Comment> parentComments = [];
  List<String> parentCommentsId = [];
  List<String> childRepliesId = [];
  List<Comments>? commentsList = [];
  List<Comments>? repliesApiList = [];
  var replyList = [];

  ScrollController _scrollController = ScrollController();
  var commentFocusNode = FocusNode();

  void _commentsModalBottomSheet(
    context,
    Posts? singlePost,
  ) {
    var size = MediaQuery.of(context).size;
    // List<Comments>? comments = singlePost!.comments;
    // List<Comments>? comments = Provider.of<AppProvider>(context, listen: false).comments;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Consumer<AppProvider>(
          builder: (context, provider, child) {
            List<Comments>? comments = context.watch<AppProvider>().comments;
            return Scaffold(
              resizeToAvoidBottomInset: true,
              body: StatefulBuilder(
                builder: ((context, StateSetter setStats) {
                  return Container(
                    padding: const EdgeInsets.only(top: 40),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.02, right: size.width * 0.02, top: size.height * 0.02),
                        child: Column(
                          children: [
                            comments!.isNotEmpty
                                ? SizedBox(
                                    height: size.height * 0.85,
                                    child: ListView.builder(
                                      controller: _scrollController,
                                      padding: const EdgeInsets.all(0),
                                      itemCount: comments.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        commentsList = comments;
                                        parentComments.clear();
                                        childReplies.clear();
                                        parentCommentsId.clear();
                                        childRepliesId.clear();
                                        isCommentLikeList!.clear();
                                        repliesApiList = commentsList?[index].replies;
                                        // if (_scrollController.hasClients) {
                                        //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                                        // }
                                        for (var comment in commentsList!) {
                                          parentComments.add(
                                              Comment(avatar: comment.user!.profileImage, userName: comment.user!.firstName, content: comment.text));
                                          parentCommentsId.add(comment.id.toString());
                                          isCommentLikeList!.add(comment.userLike!);
                                        }
                                        for (var subComment in repliesApiList!) {
                                          childReplies.add(Comment(
                                              avatar: subComment.user!.profileImage,
                                              userName: subComment.user!.firstName,
                                              content: subComment.text,
                                              createdAt: subComment.createdAt.toString(),
                                              id: subComment.id.toString(),
                                              isLiked: subComment.userLike));
                                          // childRepliesId.add(subComment.id.toString());
                                          // replyList.add(subComment.createdAt);
                                        }
                                        // like pe kam krna
                                        return CommentTreeWidget<Comment, Comment>(
                                          Comment(
                                              avatar: '${parentComments[index].avatar}',
                                              userName: '${parentComments[index].userName}',
                                              content: '${parentComments[0].content.toString()}'),
                                          childReplies,
                                          treeThemeData: const TreeThemeData(lineColor: Colors.grey, lineWidth: 3),
                                          avatarRoot: (context, data) => PreferredSize(
                                              child: CircleAvatar(
                                                radius: 18,
                                                backgroundColor: Colors.grey,
                                                backgroundImage: NetworkImage(data.avatar!),
                                              ),
                                              preferredSize: const Size.fromRadius(18)),
                                          avatarChild: (context, data) => PreferredSize(
                                              child: CircleAvatar(
                                                radius: 12,
                                                backgroundColor: Colors.grey,
                                                backgroundImage: NetworkImage(data.avatar!.toString()),
                                              ),
                                              preferredSize: Size.fromRadius(12)),
                                          contentRoot: (context, data) {
                                            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                              Container(
                                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[100],
                                                  borderRadius: BorderRadius.circular(12),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${data.userName}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
                                                    ),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                      '${data.content}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(fontWeight: FontWeight.w300, color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              DefaultTextStyle(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(color: Colors.grey[700], fontWeight: FontWeight.bold),
                                                child: Padding(
                                                  padding: EdgeInsets.only(top: size.height * 0.02),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: size.width * 0.03,
                                                      ),
                                                      Text(
                                                        DateTimeManueplate()
                                                            .giveDifferenceInTime(DateTime.parse(comments[index].createdAt.toString()))
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: size.height * 0.018,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: size.width * 0.03,
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          // debugdebugPrint("Comment ID :" + parentCommentsId[index].toString());
                                                          // debugPrint("Comment Index :" + index.toString());
                                                          //
                                                          // debugPrint("Before :" + isCommentLikeList.toString());
                                                          //if 0 (dislike) -> 1(like)
                                                          //if 1 (like)  ->  0 (dislike)
                                                          if (isCommentLikeList![index] == 0) {
                                                            setStats(() {
                                                              isCommentLikeList![index] = 1;
                                                            });
                                                          } else {
                                                            setStats(() {
                                                              isCommentLikeList![index] = 0;
                                                            });
                                                          }

                                                          setState(() {});
                                                          setStats(() {});

                                                          debugPrint("After :" + isCommentLikeList.toString());
                                                          //change comment like  status on backend

                                                          var result = await PostController().addCommentLike(
                                                            parentCommentsId[index],
                                                          );
                                                          PostsListModal? response = await AppProvider().getPostData();
                                                          for (int i = 0; i <= response!.data!.length; i++) {
                                                            if (response.data![i].id == singlePost!.id) {
                                                              debugPrint("Setting Up comments");
                                                              provider.commentsSetter = response.data![i].comments;
                                                            }
                                                          }

                                                          if (result['code'] == 200) {
                                                            setState(() {});
                                                            setStats(() {});
                                                          }
                                                        },
                                                        child: Text(
                                                          'Like',
                                                          style: TextStyle(
                                                            color: isCommentLikeList![index] == 0 ? Colors.black : Colors.blue,
                                                          ),
                                                        ),
                                                      ), //changed
                                                      SizedBox(
                                                        width: size.width * 0.03,
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          isReplying = true;
                                                          replyingId = parentCommentsId[index];
                                                          // if (commentController.text.isNotEmpty) {
                                                          //   await PostController().addReplyComment(
                                                          //     parentCommentsId[index],
                                                          //     commentController.text,
                                                          //   );
                                                          //   commentController.clear();
                                                          //   PostsListModal? response = await AppProvider().getPostData();
                                                          //   for (int i = 0; i <= response!.posts!.length; i++) {
                                                          //     if (response.posts![i].id == singlePost!.id) {
                                                          //       debugPrint("Setting Up comments");
                                                          //       provider.commentsSetter = response.posts![i].comments;
                                                          //     }
                                                          //   }
                                                          // } else {
                                                          //   Globals.showToastMethod(msg: "Please write something to post");
                                                          // }

                                                          setStats(() {});
                                                        },
                                                        child: Text('Reply'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ]);
                                          },
                                          contentChild: (context, data) {
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration:
                                                      BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(12)),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: size.width * 0.02,
                                                        top: size.height * 0.01,
                                                        right: size.width * 0.02,
                                                        bottom: size.height * 0.02),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          '${data.userName}',
                                                          style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
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
                                                              ?.copyWith(fontWeight: FontWeight.w300, color: Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                DefaultTextStyle(
                                                  style:
                                                      Theme.of(context).textTheme.caption!.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(top: 4),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          // '3h',
                                                          DateTimeManueplate()
                                                              .giveDifferenceInTime(
                                                                DateTime.parse(
                                                                  data.createdAt.toString(),
                                                                ),
                                                              )
                                                              .toString(),
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: size.height * 0.018,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        InkWell(
                                                          onTap: () async {
                                                            var result = await PostController().addReplyCommentLike(
                                                              data.id.toString(),
                                                            );
                                                            PostsListModal? response = await AppProvider().getPostData();
                                                            for (int i = 0; i <= response!.data!.length; i++) {
                                                              if (response.data![i].id == singlePost!.id) {
                                                                debugPrint("Setting Up comments");
                                                                provider.commentsSetter = response.data![i].comments;
                                                              }
                                                            }
                                                            if (result['code'] == 200) {
                                                              setState(() {});
                                                              setStats(() {});
                                                            }
                                                          },
                                                          child: Text(
                                                            'Like',
                                                            style: TextStyle(
                                                              color: data.isLiked == 0 ? Colors.black : Colors.blue,
                                                            ),
                                                          ),
                                                        ),
                                                        // SizedBox(
                                                        //   width: 24,
                                                        // ),
                                                        // Text('Reply'),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  )
                                : const Center(child: Text("No Comments here")),
                            // comments.isNotEmpty?const SizedBox(height: 0,):,
                            isReplying
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isReplying = false;
                                      });
                                      setStats(() {
                                        isReplying = false;
                                      });
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Cancel Replying",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: size.height * 0.03,
                                  backgroundImage: NetworkImage(
                                    appPro?.individualProfileModel?.data?.user?.profileImage == null
                                        ? "https://www.finetoshine.com/wp-content/uploads/2020/04/Beautiful-Girl-Wallpapers-New-Photos-Images-Pictures.jpg"
                                        : appPro!.individualProfileModel!.data!.user!.profileImage.toString(),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.04,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: commentController,
                                    autofocus: true,
                                    textInputAction: TextInputAction.done,
                                    focusNode: commentFocusNode,
                                    // onEditingComplete: () {
                                    //   debugPrint("on compl");
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
                                    //   debugPrint("on submitted");
                                    // },
                                    decoration: InputDecoration(
                                        fillColor: Colors.grey.withOpacity(0.2),
                                        filled: true,
                                        suffixIcon: InkWell(
                                          onTap: () async {
                                            if (isReplying == true) {
                                              if (commentController.text.isNotEmpty) {
                                                await PostController().addReplyComment(
                                                  replyingId,
                                                  commentController.text,
                                                );
                                                commentController.clear();
                                                isReplying = false;
                                                PostsListModal? response = await AppProvider().getPostData();
                                                for (int i = 0; i <= response!.data!.length; i++) {
                                                  if (response.data![i].id == singlePost!.id) {
                                                    debugPrint("Setting Up comments");
                                                    provider.commentsSetter = response.data![i].comments;
                                                  }
                                                }
                                              } else {
                                                Globals.showToastMethod(msg: "Please write something to post");
                                              }
                                            } else {
                                              await PostController().addPostComment(singlePost!.id.toString(), commentController.text.trim());
                                              commentController.clear();
                                              commentFocusNode.unfocus();
                                              PostsListModal? response = await AppProvider().getPostData();
                                              for (int i = 0; i <= response!.data!.length; i++) {
                                                if (response.data![i].id == singlePost.id) {
                                                  debugPrint("Setting Up comments");
                                                  provider.commentsSetter = response.data![i].comments;
                                                  if (_scrollController.hasClients) {
                                                    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                                                  }
                                                }
                                              }
                                              debugPrint("going to max intent");
                                              if (_scrollController.hasClients) {
                                                _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                                              }
                                            }
                                            // Navigator.pop(context);
                                            // parentComments.add(
                                            //     Comment(avatar: '', userName: 'Umar', content: commentController.text.trim()));

                                            // context.read<AppProvider>().getPostData();

                                            // parentComments.add(Comment(
                                            //     avatar: provider.comments!.last.user!.profileImage,
                                            //     userName: provider.comments!.last.user!.firstName,
                                            //     content: provider.comments!.last.text));

                                            // provider.commentsSetter = await PostController().
                                            //     .addPostComment(singlePost.id.toString(), commentController.text.trim());
                                            setStats(() {});
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.send,
                                            size: size.height * 0.03,
                                            color: signupclor_light,
                                          ),
                                        ),
                                        hintText: isReplying == false ? 'Write your comment' : "Write Your Reply",
                                        contentPadding: const EdgeInsets.only(top: 0.0, left: 22.0, bottom: 2.0),
                                        hintStyle: TextStyle(fontSize: size.width * 0.04, color: infocolor),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          },
        );
      },
    );
  }
}
