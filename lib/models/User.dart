class User {
  final String first_name;
  final String last_name;
  final String imagePath;
  final String username;
  final String profile_description;
  final int id;

  User({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.imagePath,
    required this.username,
    required this.profile_description
  });

}
List users = [
User(
  id: 1,
first_name: "Jenny ",
last_name: "Wilson",
imagePath: "assets/images/user.png",
username: "Jenny87",
profile_description: 'I love design and ecology'
),
  User(
      id: 1,
first_name: "Johnny",
last_name: "Nelson",
imagePath: "assets/images/user.png",
username: "John98",
profile_description: 'Machine learning is my passion'
),
  User(
      id: 1,
first_name: "Samantha",
last_name: "Lorens",
imagePath: "assets/images/user.png",
username: "Sammy",
profile_description: 'Learning python is my passion'
),
  User(
      id: 1,
first_name: "Polk",
last_name: "Jasper",
imagePath: "assets/images/user.png",
username: "PJ",
profile_description: 'Backend'
),
  User(
      id: 1,
first_name: "Mike",
last_name: "Adams",
imagePath: "assets/images/user.png",
username: "MikeyMouse",
profile_description: 'Animation and 3D modeling'
),
  User(
      id: 1,
first_name: "Stan",
last_name: "Park",
imagePath: "assets/images/user.png",
username: "SuP",
profile_description: 'Frontend'
),
  User(
      id: 1,
first_name: "Jane",
last_name: "Doe",
imagePath: "assets/images/user.png",
username: "Lola",
profile_description: 'New York Times'
),
  User(
      id: 1,
first_name: "John",
last_name: "Doe",
imagePath: "assets/images/user.png",
username: "JadeSmith",
profile_description: 'Development'
),
];