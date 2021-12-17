class Estados {
  String title, content, picUrl, uid;
  String? id;

  Estados(
    {required this.uid,
    this.id,
    required this.title, 
    required this.content, 
    required this.picUrl}
  );

  factory Estados.fromJson(Map<String, dynamic> map){
    final data = map["data"];
    return Estados(
      uid: data['uid'],
      id: data['id'],
      title: data['title'], 
      content: data['content'], 
      picUrl: data['picUrl']);
  }
  Map<String, dynamic> toJson(){
    return {
      "title": title,
      "content": content,
      "picUrl": picUrl,
      "uid": uid,
      "id": id,
    };
  }
}