
class NewRecipePost{

    final String newrecipeimg;
    final String newrecipename;
    final String newrecipetime;
    final String newrecipepost_id;
    final String userId;
    final String newrecipelevel;
    final String newrecipeingredients;
    final String newrecipeprocedure;
    bool isLiked;
    final int rate;

  NewRecipePost({
    required this.newrecipeimg, 
    required this.newrecipename, 
    required this.newrecipetime, 
    required this.newrecipepost_id,
    required this.userId, 
    required this.newrecipelevel, 
    required this.newrecipeingredients, 
    required this.newrecipeprocedure,
    required this.isLiked,
    required this.rate,
    });

    Map<String, dynamic> toJson() => {
      'newrecipepost_id' : newrecipepost_id,
      'newrecipeimg' : newrecipeimg,
      'newrecipename' : newrecipename,
      'newrecipetime' : newrecipetime,
      'newrecipelevel' : newrecipelevel,
      'userId': userId,
      'newrecipeingredients' : newrecipeingredients,
      'newrecipeprocedure' : newrecipeprocedure,
      'isLiked': isLiked,
      'rate': rate,
    };

    static NewRecipePost fromJson(Map<String, dynamic> json) => NewRecipePost(
      newrecipepost_id: json['newrecipepost_id'],
      newrecipeimg: json['newrecipeimg'],
      newrecipename: json['newrecipename'],
      newrecipetime: json['newrecipetime'],
      newrecipelevel: json['newrecipelevel'],
      userId: json['userId'],
      newrecipeingredients: json['newrecipeingredients'],
      newrecipeprocedure: json['newrecipeprocedure'],
      isLiked: json['isLiked'],
      rate: json['rate'],

       ); 
}