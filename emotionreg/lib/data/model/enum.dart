const String path = "assets/character";

enum Feel {
  happy(
      image: "$path/3 1.png",
      description: "Keep spreading those positive vibes!",
      title: "Happy"),
  fear(
      image: "$path/6 (1) 1.png",
      description:
          "Maybe a relaxing activity or talking to a friend could help.",
      title: "fear"),
  disgust(image: "$path/5 (1) 1.png", description: "disgust", title: "Disgust"),
  neutral(image: "$path/8 (1) 1.png", description: "neutral", title: "neutral"),
  surprised(
      image: "$path/9 (1) 1.png", description: "neutral", title: "neutral"),
  sad(image: "$path/4 (1) 1.png", description: "Sad", title: "Sad");

  final String image;
  final String description;
  final String title;

  const Feel(
      {required this.image, required this.description, required this.title});
}
