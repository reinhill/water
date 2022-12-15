
class DinnerCat{

    final String dinnercatimg;
    final String dinnercatname;
    final String dinnercattime;
    final String dinnercatid;
    final String dinnercatlevel;
    final String dinnercatingredients;
    final String dinnercatprocedure;
    bool isLiked;
    final int rate;

  DinnerCat({
    required this.dinnercatimg, 
    required this.dinnercatname, 
    required this.dinnercattime, 
   required this.dinnercatid, 
    required this.dinnercatlevel, 
    required this.dinnercatingredients, 
    required this.dinnercatprocedure,
    required this.isLiked,
    required this.rate,
    });

    Map<String, dynamic> toJson() => {
     
      'dinnercatimg' : dinnercatimg,
      'dinnercatname' : dinnercatname,
      'dinnercattime' : dinnercattime,
      'dinnercatlevel' : dinnercatlevel,
     'dinnercatid' : dinnercatid,
      'dinnercatingredients' : dinnercatingredients,
      'dinnercatprocedure' : dinnercatprocedure,
      'isLiked': isLiked,
      'rate': rate,
    };

    static DinnerCat fromJson(Map<String, dynamic> json) => DinnerCat(
  
      dinnercatimg: json['dinnercatimg'],
      dinnercatname: json['dinnercatname'],
      dinnercattime: json['dinnercattime'],
      dinnercatlevel: json['dinnercatlevel'],
       dinnercatid: json['dinnercatid'],
      dinnercatingredients: json['dinnercatingredients'],
      dinnercatprocedure: json['dinnercatprocedure'],
      isLiked: json['isLiked'],
      rate: json['rate'],

       ); 
}