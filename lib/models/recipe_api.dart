import 'dart:convert';
import 'package:recipelist/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApp{
//   var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
// 	"limit": "18",
// 	"start": "0",
// 	"tag": "list.recipe.popular"
// });

// req.headers({
// 	"x-rapidapi-host": "yummly2.p.rapidapi.com",
// 	"x-rapidapi-key": "9fbcb7d241msh2506481c68d7ddfp180a95jsn0b6c4ea71314",
// 	"useQueryString": true
// });


// req.end(function (res) {
// 	if (res.error) throw new Error(res.error);

// 	console.log(res.body);
// });

static Future<List<Recipe>> getRecipe() async {
  var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
  {"limit": "18","start": "0","tag": "list.recipe.popular"});

  final response = await http.get(uri, headers: {
    "x-rapidapi-host": "yummly2.p.rapidapi.com",
    "x-rapidapi-key": "9fbcb7d241msh2506481c68d7ddfp180a95jsn0b6c4ea71314",
    "useQueryString": "true"


  });

  Map data = jsonDecode(response.body);
  List _temp = [];

  for (var i in data['feed']){
    _temp.add(i['content']['details']);
  }

  return Recipe.recipesFromSnapshot(_temp);
}

}
