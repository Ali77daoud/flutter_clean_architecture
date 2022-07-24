import 'dart:convert';

import 'package:clean_archeticture/core/error/exception.dart';
import 'package:clean_archeticture/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource{
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int id);
  Future<Unit> updatePost(PostModel postModel);
  Future<Unit> addPost(PostModel postModel);
}

const baseUrl = "https://jsonplaceholder.typicode.com";

class PostRemoteDataSourceImpWithHttp implements PostRemoteDataSource{
  final http.Client client;

  PostRemoteDataSourceImpWithHttp({required this.client});

   @override
  Future<List<PostModel>> getAllPosts() async{
   final response = await client.get(
    Uri.parse(baseUrl+'/posts/'),
    headers: {
      'Content_Type': 'application/json'
    }
   );

   if(response.statusCode == 200){
    final List decodedJson = json.decode(response.body) as List;

    final List<PostModel> postModels = decodedJson.map((e) => PostModel.fromJson(e)).toList();
    return postModels;

   }else{
    throw ServerException();
   }

  }

  @override
  Future<Unit> addPost(PostModel postModel) async{
    final body = {
      'title':postModel.title,
      'body':postModel.body,
    };

    final response = await client.post(
      Uri.parse(baseUrl+'/posts/'),
      body: body,
    );

    if(response.statusCode == 201){
      return Future.value(unit);
    }else{
      throw ServerException();
    }

  }

  @override
  Future<Unit> deletePost(int id) async{
    final response = await client.delete(
      Uri.parse(baseUrl+'/posts/${id.toString()}'),
      headers: {
      'Content_Type': 'application/json'
      }
    );

    if(response.statusCode == 200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }
  }



  @override
  Future<Unit> updatePost(PostModel postModel) async{
    final body = {
      'title':postModel.title,
      'body':postModel.body,
    };

    final postId = postModel.id;

    final response = await client.patch(
      Uri.parse(baseUrl+'/posts/${postId.toString()}'),
      body: body
    );

    if(response.statusCode == 200){
      return Future.value(unit);
    }else{
      throw ServerException();
    }
  }

}

class PostRemoteDataSourceImpWithDio implements PostRemoteDataSource{
  @override
  Future<Unit> addPost(PostModel postModel) {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Unit> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> updatePost(PostModel postModel) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }

}

