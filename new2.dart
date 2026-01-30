// import 'package:flutter/material.dart';

// class AddNotePage extends StatefulWidget {
//   const AddNotePage({super.key});

//   @override
//   State<AddNotePage> createState() => _AddNotePageState();
// }

// class _AddNotePageState extends State<AddNotePage> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _contentController = TextEditingController();

//   void _saveNote() {
//     final String title = _titleController.text.trim();
//     final String content = _contentController.text.trim();

//     if (title.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter a title')),
//       );
//       return;
//     }

//     // For now just print (later connect DBHelper)
//     print('Note Saved: Title: $title, Content: $content');

//     // Close the screen after saving
//     Navigator.pop(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Note'),
//         backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: const InputDecoration(
//                 labelText: 'Title',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: _contentController,
//               decoration: const InputDecoration(
//                 labelText: 'Content',
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: 5,
//             ),

//             const SizedBox(height: 24),

            
//             ElevatedButton(
//               onPressed: _saveNote,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               ),
//               child: const Text(
//                 'Save',
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





















import 'package:flutter/material.dart';

class Mynotes extends StatefulWidget {
  final String? title;
  final String? note;

  const Mynotes({super.key, this.title, this.note});

  @override
  State<Mynotes> createState() => _MynotesState();
}

class _MynotesState extends State<Mynotes> {
  late TextEditingController titleController;
  late TextEditingController noteController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title ?? '');
    noteController = TextEditingController(text: widget.note ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Center(
            child: Text(
              'My Notes',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor:  Colors.teal.shade600,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
               SizedBox(height: 16),
               Padding(
                 padding: const EdgeInsets.only(right: 320),
                 child: Text("Title",style: TextStyle(fontSize: 25,
                 fontWeight: FontWeight.bold
                 ),),
               ),
                SizedBox(height: 16)
,              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: titleController,
                  decoration:  InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                ),
              ),
               SizedBox(height: 16),
               Padding(
                 padding: const EdgeInsets.only(right: 310),
                 child: Text("Content",style: TextStyle(fontSize: 25,
                 fontWeight: FontWeight.bold
                 ),),
               ),
                SizedBox(height: 16),
             Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: noteController,
                  decoration:  InputDecoration(labelText: 'Note',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
                  ),
                  maxLines: 4,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty ||
                        noteController.text.isNotEmpty) {
                      Navigator.pop(context, {
                        'title': titleController.text,
                        'note': noteController.text,
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }
}