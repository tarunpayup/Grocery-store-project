class UserModel{
  final int id;
  final String name;
  final String email;
  UserModel(
    {
      required this.id,
      required this. name,
      required this.email
    }
  );

factory UserModel.fromJSON(Map<String,dynamic> userjson){
  return UserModel(
    id: userjson["id"], 
    name: userjson["name"], 
    email: userjson["email"]);
}
}