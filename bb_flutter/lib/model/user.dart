
class User {
  String name;
  String imageUrl;

  User(this.name, this.imageUrl);
  User.fromJson(Map<dynamic, dynamic> data){
    name = data['name'];
    imageUrl = data['imageUrl'];
  }

  toJson()=>
      {
        'name': name,
        'imageUrl': imageUrl
      };

}
