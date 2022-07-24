import 'dart:convert';

import 'package:clean_archeticture/core/error/exception.dart';
import 'package:clean_archeticture/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostslocalDataSource{
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachPosts(List<PostModel> postModel);
}

const cachedPosts = "cached_posts";

class PostsLocalDataSourceImp implements PostslocalDataSource{
  final SharedPreferences sharedPreferences;

  PostsLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<Unit> cachPosts(List<PostModel> postModels) {
    List postModelToJson = postModels.map((postModel) => postModel.toJson()).toList();

    sharedPreferences.setString(cachedPosts, json.encode(postModelToJson));

    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(cachedPosts);

    if(jsonString != null){
      List decodeJsonData = json.decode(jsonString);

      List<PostModel> jsonToPostModel = decodeJsonData.
      map((jsonPostModel) => PostModel.fromJson(jsonPostModel)).toList();

      return Future.value(jsonToPostModel);
    }else{
      throw EmptyCachException();
    }
  }

}


