// Each message sent by user

class Msg {
  late String body;
  late String author;
  int likes = 0;
  bool userLiked = false;

  // constructor for Msg
  Msg({required this.body, required this.author});

  void likedMsg() {
    this.userLiked = !this.userLiked;
    // if (this.userLiked) {
    //   this.likes += 1;
    // } else {
    //   this.likes -= 1;
    // }
  }
}
