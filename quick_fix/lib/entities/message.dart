enum Fromwho { mine, you }

class Message {
  final String text;
  //final String? imageURL;
  final Fromwho fromwho;

  Message({required this.text, required this.fromwho});
}
