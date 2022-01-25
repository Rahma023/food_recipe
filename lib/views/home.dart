//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:recipelist/models/recipe.dart';
import 'package:recipelist/views/widgets/recipe_card.dart';
import 'package:recipelist/models/recipe_api.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async{
   _recipes = await RecipeApp.getRecipe();
    setState(() {
      _isLoading = false;
    });
  
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: const [
        Icon(Icons.restaurant_menu),
        SizedBox(width: 10),
        Text("Food recipe")
        
      ],),
      ),

      body: _isLoading
      ? const Center(
        child: CircularProgressIndicator())
        : ListView.builder(
          itemCount: _recipes.length,
          itemBuilder: (context, index){
            return RecipeCard(
              title: _recipes[index].name,
              cookTime: _recipes[index].totalTime,
              rating: _recipes[index].rating.toString(),
              thumbnailUrl: _recipes[index].images);
          },
         ) );
          
  }
}