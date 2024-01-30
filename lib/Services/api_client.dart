import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import '../../_env/env.dart';

class ApiClient {
  // Future likeget(String content) async {
  //   final response = await http
  //       .get(Uri.parse('http://edutech.vass.co.in/api/v1/blog/likeview/1'));
  //   var datalikeget = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     print(datalikeget);
  //     return GetLike.fromJson(datalikeget);
  //   } else {
  //     return GetLike.fromJson(datalikeget);
  //   }
  // }

  static Future likepost(String userName, String password) async {
    var requestbody = {"blog_id": 1, "is_liked": true};
    final http.Response response = await http.post(
        Uri.parse("http://edutech.vass.co.in/api/v1/blog/like"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestbody));
    if (response.statusCode == 200) {
      // final postlikeresponse = GetLike.fromJson(json.decode(response.body));
      // // print(loginresponse.token);
      // return postlikeresponse;
    } else {
      print(response.body);
      return null;
    }
  }

  // Future getUserPost() async {
  //   try {
  //     Response response = await userdioClient.dio.get(EndPoints.getUserposts);

  //     if (response.statusCode == 200) {
  //       final listData = response.data as List;
  //       return listData.map((e) => UserPosts.fromMap(e)).toList();
  //     }
  //   } on DioError catch (e) {
  //     print(e.response);
  //   }
  // }

  // Future createComment(String content, String postId) async {
  //   var data = json.encode({"content": content, "post_id": postId});
  //   try {
  //     Response response =
  //         await userdioClient.dio.post(EndPoints.createComment, data: data);

  //     if (response.statusCode == 200) {
  //       return CreateComment.fromJson(response.data);
  //     }
  //   } on DioError catch (e) {
  //     print(e.response);
  //   }
  // }

  // Future viewComments(String postId) async {
  //   try {
  //     Response response = await userdioClient.dio.get(
  //         EndPoints.getLatestCommentByPost,
  //         queryParameters: {"post_id": postId});

  //     if (response.statusCode == 200) {
  //       final listData = response.data as List;
  //       return listData.map((e) => Comments.fromJson(e)).toList();
  //     }
  //   } on DioError catch (e) {
  //     print(e.response);
  //   }
  // }

  // Future createLike(String postId) async {
  //   var data = json.encode({"post_id": postId});
  //   try {
  //     Response response =
  //         await userdioClient.dio.post(EndPoints.createPostLike, data: data);

  //     if (response.statusCode == 200) {
  //       return CreateLike.fromJson(response.data);
  //     }
  //   } on DioError catch (e) {
  //     print(e.response);
  //   }
  // }

  // Future getPostLikes(String postId) async {
  //   try {
  //     Response response = await userdioClient.dio
  //         .get(EndPoints.getLikes, queryParameters: {"post_id": postId});
  //     print(response.data);
  //     return Likes.fromJson(response.data);
  //   } on DioError catch (e) {
  //     print(e.response);
  //   }
  // }

  // Future deletePostLikes(String postId) async {
  //   var data = json.encode({"post_id": postId});
  //   try {
  //     Response response =
  //         await userdioClient.dio.post(EndPoints.deletePostLikes, data: data);

  //     return Likes.fromJson(response.data);
  //   } on DioError catch (e) {
  //     print(e.response);
  //   }
  // }

  // Future getCommentLikes(String commentId) async {
  //   try {
  //     Response response = await userdioClient.dio
  //         .get(EndPoints.getLikes, queryParameters: {"comment_id": commentId});
  //     print(response.data);
  //     return Likes.fromJson(response.data);
  //   } on DioError catch (e) {
  //     print(e.response);
  //   }
  // }
}
