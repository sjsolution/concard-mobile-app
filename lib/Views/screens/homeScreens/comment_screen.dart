import 'package:concard/Constants/colors.dart';
import 'package:concard/Controllers/compnayControllers/postController.dart';
import 'package:concard/Models/post_list_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:comment_tree/comment_tree.dart';

class MyPostCommentScreen extends StatefulWidget {
  MyPostCommentScreen(
      {Key? key, required this.context, required this.singlePost})
      : super(key: key);
  BuildContext? context;
  Posts? singlePost;
  @override
  State<MyPostCommentScreen> createState() => _MyPostCommentScreenState();
}

class _MyPostCommentScreenState extends State<MyPostCommentScreen> {
  var commentController = TextEditingController();

  // List<bool>? isCommentLikeList = [];
  List<Comments>? comments = [];
  bool? isprofile = false;
  bool? isSendBtn = false;
  bool? isShow = false;

  List<Comment> childReplies = [];
  List<Comment> parentComments = [];
  List<String> parentCommentsId = [];
  List<String> childRepliesId = [];
  var commentsList = [];
  var repliesApiList = [];
  @override
  void initState() {
    // TODO: implement initState
    comments = widget.singlePost!.comments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
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
                              itemCount: comments!.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                commentsList = comments!;
                                parentComments.clear();
                                childReplies.clear();
                                parentCommentsId.clear();
                                childRepliesId.clear();
                                 List<bool>? isCommentLikeList=[];
                                  isCommentLikeList.clear();
                                repliesApiList = commentsList[index].replies;
                                for (var comment in commentsList) {
                                  parentComments.add(Comment(
                                      avatar: comment.individualUser!.image,
                                      userName: comment.individualUser!.firstName,
                                      content: comment.text));
                                  parentCommentsId.add(comment.id.toString());
                                  isCommentLikeList.add(
                                      comment.userLike == 1 ? true : false);
                                }
                                for (var subComment in repliesApiList) {
                                  childReplies.add(Comment(
                                      avatar: subComment.individualUser!.image,
                                      userName: subComment.individualUser!.firstName,
                                      content: subComment.text));
                                  childRepliesId.add(subComment.id.toString());
                                }
                                // like pe kam krna
                                return CommentTreeWidget<Comment, Comment>(
                                  Comment(
                                      avatar: '${parentComments[index].avatar}',
                                      userName:
                                          '${parentComments[index].userName}',
                                      content:
                                          '${parentComments[index].content}'),
                                  childReplies,
                                  treeThemeData: const TreeThemeData(
                                      lineColor: Colors.grey, lineWidth: 3),
                                  avatarRoot: (context, data) => PreferredSize(
                                      child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.grey,
                                        backgroundImage:
                                            NetworkImage(data.avatar!),
                                      ),
                                      preferredSize: const Size.fromRadius(18)),
                                  avatarChild: (context, data) => PreferredSize(
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.grey,
                                        backgroundImage:
                                            NetworkImage(data.avatar!),
                                      ),
                                      preferredSize: Size.fromRadius(12)),
                                  contentChild: (context, data) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: size.width * 0.02,
                                                top: size.height * 0.01,
                                                right: size.width * 0.02,
                                                bottom: size.height * 0.02),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          color: Colors.black),
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
                                                  const EdgeInsets.only(top: 4),
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
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 8),
                                            decoration: BoxDecoration(
                                                color: Colors.grey[100],
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${data.userName}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black),
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
                                                              FontWeight.w300,
                                                          color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          DefaultTextStyle(
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption!
                                                .copyWith(
                                                    color: Colors.grey[700],
                                                    fontWeight:
                                                        FontWeight.bold),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: size.height * 0.02),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: size.width * 0.03,
                                                  ),
                                                  Text(
                                                    '3h',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize:
                                                          size.height * 0.018,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.03,
                                                  ),
                                                  InkWell(
                                                      onTap: () async {
                                                        debugPrint(
                                                            "Comment ID :" +
                                                                parentCommentsId[
                                                                        index]
                                                                    .toString());
                                                        debugPrint(
                                                            "Comment Index :" +
                                                                index
                                                                    .toString());

                                                        debugPrint("Before :" +
                                                            isCommentLikeList
                                                                .toString());

                                                        //change comment like button status on frontend
                                                        //if 0 (dislike) -> 1(like)
                                                        //if 1 (like)  ->  0 (dislike)

                                                        setState(() {
                                                          isCommentLikeList[
                                                                  index] =
                                                              !isCommentLikeList[
                                                                  index];
                                                        });

                                                        debugPrint("After :" +
                                                            isCommentLikeList
                                                                .toString());
                                                        //change comment like  status on backend
                                                        // var result =
                                                            await PostController()
                                                                .addCommentLike(
                                                          parentCommentsId[
                                                              index],
                                                        );
                                                        // if (result['code'] ==
                                                        //     200) {
                                                        //   print(
                                                        //       "20000000000-------");
                                                        //   setState(() {});
                                                        // }
                                                        setState(() {});
                                                      },
                                                      child: Text('Like',
                                                          style: TextStyle(
                                                              color: isCommentLikeList[
                                                                      index]
                                                                  ? Colors.blue
                                                                  : Colors
                                                                      .black))), //changed
                                                  SizedBox(
                                                    width: size.width * 0.03,
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
                                      fillColor: Colors.grey.withOpacity(0.2),
                                      filled: true,
                                      suffixIcon: InkWell(
                                          onTap: () async {
                                            // Navigator.pop(context);
                                            parentComments.add(Comment(
                                                avatar: '',
                                                userName: 'Umar',
                                                content: commentController.text
                                                    .trim()));

                                            await PostController()
                                                .addPostComment(
                                                    widget.singlePost!.id
                                                        .toString(),
                                                    commentController.text
                                                        .trim());
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.send,
                                            size: size.height * 0.03,
                                            color: signupclor_light,
                                          )),
                                      hintText: 'Write your comment',
                                      contentPadding: const EdgeInsets.only(
                                          top: 0.0, left: 22.0, bottom: 2.0),
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
            )));
  }
}
