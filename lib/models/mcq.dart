class MCQ {
  String question = "";
  List<String> options = [];
  int answer = 0;

  MCQ({required this.question, required this.options, required this.answer});

  MCQ.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    options = json['options'].cast<String>();
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    data['options'] = this.options;
    data['answer'] = this.answer;
    return data;
  }
}
