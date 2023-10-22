import 'dart:convert';

import 'package:ebook/Models/Mostpopular.dart';
import 'package:ebook/Models/author.dart';
import 'package:ebook/Models/categoryModel.dart';
import 'package:ebook/Models/comments.dart';
import 'package:ebook/Models/continueReading.dart';
import 'package:ebook/Models/signinModel.dart';
import 'package:ebook/Models/singleBook.dart';
import 'package:ebook/staticData.dart';
import 'package:http/http.dart' as http;

class NetworkApi {
  static final Basurl = 'https://tasn.afaqoutsource.com/Home/';
  static final Basurl1 = 'https://tasn.afaqoutsource.com/';

  Future postlogin(String email, String password) async {
    var url = Uri.parse(Basurl + 'login');
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    List list = jsonDecode(response.body);
    SignInModel.getuserid(list);
  }

  Future postGoogleSignup(String email, String username) async {
    var url = Uri.parse(Basurl + 'register');
    var response = await http.post(url, body: {
      'user_email': email,
      'name': username,
    });
    List list = jsonDecode(response.body);
    SignInModel.getuserid(list);
  }

  Future postSignup(String email, String password, String username) async {
    var url = Uri.parse(Basurl + 'register');
    var response = await http.post(url, body: {
      'email': email,
      'password': password,
      'name': username,
    });
    List list = jsonDecode(response.body);
    SignInModel.getuserid(list);
  }

  Future postGoogleSignin(String email, String username) async {
    var url = Uri.parse(Basurl + 'login');
    var response = await http.post(url, body: {
      'user_email': email,
      'name': username,
    });
    List list = jsonDecode(response.body);
    SignInModel.getuserid(list);
  }

  Future getContinueReading() async {
    var url = Uri.parse(Basurl + 'getContinueRead');
    var response = await http.post(url, body: {
      'user_id': StaticData.userid,
    });
    List list = jsonDecode(response.body);
    ContinueReadingModel.getuserid(list);
  }

  Future getcategory() async {
    var url = Uri.parse(Basurl + 'getCategory');
    var response = await http.post(url, body: {
      'user_id': StaticData.userid,
    });
    List list = jsonDecode(response.body);
    CategoryModel.getuserid(list);
  }

  Future getAuthor() async {
    var url = Uri.parse(Basurl + 'getAuthor');
    var response = await http.post(url, body: {
      'user_id': StaticData.userid,
    });
    List list = jsonDecode(response.body);
    AuthorModel.getuserid(list);
  }

  Future getMostpopular() async {
    var url = Uri.parse(Basurl + 'mostPopular');
    var response = await http.post(url, body: {
      'user_id': StaticData.userid,
    });
    List list = jsonDecode(response.body);
    MostPopularModel.getuserid(list);
  }

  Future getrecent() async {
    var url = Uri.parse(Basurl + 'recentlyAdded');
    var response = await http.post(url, body: {});
    List list = jsonDecode(response.body);
    ContinueReadingModel.getuserid(list);
  }

  Future getBook(String catid) async {
    var url = Uri.parse(Basurl + 'getBooks');
    var response = await http.post(url, body: {
      'user_id': StaticData.userid,
      'category_id': catid,
    });
    List list = jsonDecode(response.body);
    ContinueReadingModel.getuserid(list);
  }

  Future getauthorBook(String authorId) async {
    var url = Uri.parse(Basurl + 'getBooks');
    var response = await http.post(url, body: {
      'user_id': StaticData.userid,
      'author_id': authorId,
    });
    List list = jsonDecode(response.body);
    ContinueReadingModel.getuserid(list);
  }

  Future getFavourite() async {
    var url = Uri.parse(Basurl + 'getFavourite');
    var response = await http.post(url, body: {
      'user_id': StaticData.userid,
    });
    List list = jsonDecode(response.body);
    ContinueReadingModel.getuserid(list);
  }

  Future addRatings(String bookid, String rate) async {
    var url = Uri.parse(Basurl + 'giveRating');
    var response = await http.post(url, body: {
      'user_id': StaticData.userid,
      'book_id': bookid,
      'rate': rate,
    });
  }

  Future addComments(String bookid, String commentText) async {
    var url = Uri.parse(Basurl + 'addComment');
    var response = await http.post(url, body: {
      'user_id': StaticData.userid,
      'book_id': bookid,
      'comment': commentText,
    });
  }

  Future singleItem(String bookid) async {
    var url = Uri.parse(Basurl + 'singleBook');
    var response = await http.post(url, body: {
      'user_id': StaticData.userid,
      'book_id': bookid,
    });
    List list = jsonDecode(response.body);
    SingleBookModel.getuserid(list);
  }

  Future addtofav(String bookid) async {
    var url = Uri.parse(Basurl + 'addToFavourite');
    var response = await http.post(url, body: {
      'user_id': StaticData.userid,
      'book_id': bookid,
    });
  }

  Future getComment(String bookid) async {
    var url = Uri.parse(Basurl + 'getComments');
    var response = await http.post(url, body: {
      'book_id': bookid,
    });
    List list = jsonDecode(response.body);
    CommentsModel.getuserid(list);
  }
}
