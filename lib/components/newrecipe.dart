 
class NewRecipe{

  String? recipeName;
  String? recipeTime;
  String? recipeLevel;
  List<String>? ingredients;
  List<String>? procedure;

  NewRecipe({
    this.recipeName, this.recipeTime, this.recipeLevel, this.ingredients, this.procedure
  });

  Map<String, dynamic> toJson(){
      final Map<String, dynamic> data = new Map<String, dynamic>(); 

      data['RecipeName'] = recipeName;
      data['RecipeTime'] = recipeTime;
      data['RecipeLevel'] = recipeLevel;
      data['Ingredients'] = ingredients;
      data['Procedure'] = procedure;

      return data; 

  }
}