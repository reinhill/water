
class FavoriteRecipePost{

    final String favrecipeimg;
    final String favrecipename;
    final String favrecipetime;
    final String favrecipepost_id;
    final String userId;
    final String favrecipelevel;
    final String favrecipeingredients;
    final String favrecipeprocedure;
    bool isLiked;
    final int rate;

  FavoriteRecipePost({
    required this.favrecipeimg, 
    required this.favrecipename, 
    required this.favrecipetime, 
    required this.favrecipepost_id,
    required this.userId, 
    required this.favrecipelevel, 
    required this.favrecipeingredients, 
    required this.favrecipeprocedure,
    required this.isLiked,
    required this.rate,
    });

    Map<String, dynamic> toJson() => {
      'favrecipepost_id' : favrecipepost_id,
      'favrecipeimg' : favrecipeimg,
      'favrecipename' : favrecipename,
      'favrecipetime' : favrecipetime,
      'favrecipelevel' : favrecipelevel,
      'userId': userId,
      'favrecipeingredients' : favrecipeingredients,
      'favrecipeprocedure' : favrecipeprocedure,
      'isLiked': isLiked,
      'rate': rate,
    };

    static FavoriteRecipePost fromJson(Map<String, dynamic> json) => FavoriteRecipePost(
      favrecipepost_id: json['favrecipepost_id'],
      favrecipeimg: json['favrecipeimg'],
      favrecipename: json['favrecipename'],
      favrecipetime: json['favrecipetime'],
      favrecipelevel: json['favrecipelevel'],
      userId: json['userId'],
      favrecipeingredients: json['favrecipeingredients'],
      favrecipeprocedure: json['favrecipeprocedure'],
      isLiked: json['isLiked'],
      rate: json['rate'],

       ); 
}