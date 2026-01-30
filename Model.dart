// class Company {
//   int? id;
//   String title;
//   String content;


//   Company({
//     required this.content,
//     required this.title,
//     this.id,
   
//   });

//   // Create company from database Map
//   factory Company.fromMap(Map<String, dynamic> json) {
//     return Company(
//       id: json["id"],
     
//       title: json["title"],
//       content: json["content"],
//     );
//   }

//   // Convert company to Map for database
//   Map<String, dynamic> json() {
//     return {
//       "id": id,
      
//       "title": title,
//       "content": content,
//     };
//   }

//   @override
//   String toString() {
//     return 'Company{id: $id, title: $title, content: $content}';
//   }
// }









class Company {
  int? id;
  String title;
  String content;

  Company({this.id, required this.title, required this.content});

  Map<String, dynamic> toMap() {
    final map = {'title': title, 'content': content};
    
    return map;
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      id: map['id'],
      title: map['title'],
      content: map['content'],
    );
  }
}
