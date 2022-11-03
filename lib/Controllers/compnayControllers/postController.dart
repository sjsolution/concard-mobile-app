import 'dart:developer';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:concard/Controllers/OthersController/sharedPrefController.dart';
import 'package:concard/Models/post_list_modal.dart';
import 'package:concard/Services/network.dart';
import 'package:dio/dio.dart';
import 'package:concard/Constants/globals.dart' as Globals;
import 'package:flutter/cupertino.dart';
import 'package:concard/Controllers/providers/app_providers.dart';

class PostController {
  ServicesClass services = ServicesClass();
  LocalStorageClass localStorageClass = LocalStorageClass();
  Future<PostsListModal?> getPostList(BuildContext context) async {
    try {
      var formData = FormData.fromMap({});
      var response = await services.postResponse(url: '/posts/list', formData: formData);
      debugPrint(response.toString());
      if (response != null) {
        PostsListModal? postsListModal = PostsListModal.fromJson(response);
        Globals.postsListModal = postsListModal;
        // context.read<AppProvider>().setLoadingFalse();
        return postsListModal;
      } else {
        Globals.showToastMethod(msg: "Something went wrong. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("post list exception:" + e.toString());
      return null;
    }
  }

  Future addPost({String? text, String? postImage}) async {
    try {
      var formData = text == null
          ? FormData.fromMap({
              "file": await MultipartFile.fromFile(postImage!),
            })
          : postImage == null
              ? FormData.fromMap({
                  "text": text,
                })
              : FormData.fromMap({
                  "text": text,
                  "file": await MultipartFile.fromFile(postImage),
                });
      var response = await services.postResponse(url: '/posts/store', formData: formData);
      if (response != null) {
        return response;
      } else {
        Globals.showToastMethod(msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("add post exception:" + e.toString());
      return null;
    }
  }

  Future addPostLike(String? postId) async {
    try {
      var formData = FormData.fromMap({
        "post_id": postId,
        // "text": isLike,
      });
      var response = await services.postResponse(url: '/like/post-like', formData: formData);
      if (response != null) {
        return response;
      } else {
        Globals.showToastMethod(msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("post like exception:" + e.toString());
      return null;
    }
  }

  Future addCommentLike(String? commentId) async {
    try {
      var formData = FormData.fromMap({
        "comment_id": commentId,
        // "text": isLike,
      });
      var response = await services.postResponse(url: '/like/comment-like', formData: formData);
      if (response != null) {
        debugPrint(response.toString());
        return response;
      } else {
        Globals.showToastMethod(msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("comment like exception:" + e.toString());
      return null;
    }
  }

  Future addReplyCommentLike(String? replyCommentId) async {
    try {
      var formData = FormData.fromMap({
        "reply_id": replyCommentId,
        // "text": isLike,
      });
      var response = await services.postResponse(url: '/like/reply-comment-like', formData: formData);
      if (response != null) {
        return response;
      } else {
        Globals.showToastMethod(msg: "Something went wrong. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("reply comment  like exception:" + e.toString());
      return null;
    }
  }

  Future addPostComment(String? postId, String? comment) async {
    try {
      var formData = FormData.fromMap({
        "post_id": postId,
        "text": comment!,
      });
      var response = await services.postResponse(url: '/comment/send-comment', formData: formData);
      if (response != null) {
        return response;
      } else {
        Globals.showToastMethod(msg: "Something went wrong. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("post comment exception:" + e.toString());
      return null;
    }
  }

  Future addReplyComment(String? commentId, String? comment) async {
    try {
      var formData = FormData.fromMap({
        "comment_id": commentId,
        "text": comment,
      });
      var response = await services.postResponse(url: '/comment/reply-comment', formData: formData);
      if (response != null) {
        return response;
      } else {
        Globals.showToastMethod(msg: "There is something went worng. Please try again later");
        return null;
      }
    } catch (e) {
      debugPrint("post reply comment exception:" + e.toString());
      return null;
    }
  }
}
