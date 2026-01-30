// import 'package:flutter/material.dart';
// import 'package:myapp/new2.dart';

// class Page2 extends StatefulWidget {
//   const Page2({super.key});

//   @override
//   State<Page2> createState() => _Page2State();
// }

// class _Page2State extends State<Page2> {
//   List<Map<String, String>> notes = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'CheckMate',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//       ),

//       body: notes.isEmpty
//           ? const Center(
//               child: Text(
//                 'Welcome to CheckMate!',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             )
//           : ListView.builder(
//               itemCount: notes.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   margin: const EdgeInsets.all(10),
//                   child: ListTile(
//                     title: Text(
//                       notes[index]['title'] ?? '',
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text(notes[index]['content'] ?? ''),
//                   ),
//                 );
//               },
//             ),

//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//         child: const Icon(Icons.add, size: 30),
//         onPressed: () async {
//           final result = await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const AddNotePage(),
//             ),
//           );

//           if (result != null && result is Map<String, String>) {
//             setState(() {
//               notes.add(result);
//             });
//           }
//         },
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:myapp/dbhelper.dart';

// import 'Model.dart';
// import 'new2.dart';

// class Page2 extends StatefulWidget {
//   const Page2({super.key});

//   @override
//   State<Page2> createState() => _Page2State();
// }

// class _Page2State extends State<Page2> {
//   final DatabaseHelper dbHelper = DatabaseHelper();

//   Future<List<Company>> _getNotes() {
//     return dbHelper.getNotes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'CheckMate',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//       ),

//       body: FutureBuilder<List<Company>>(
//         future: _getNotes(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(
//               child: Text(
//                 'Welcome to CheckMate!',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             );
//           }

//           final notes = snapshot.data!;

//           return ListView.builder(
//             itemCount: notes.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 margin: const EdgeInsets.all(10),
//                 child: ListTile(
//                   title: Text(
//                     notes[index].title,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(notes[index].content ?? ''),
//                 ),
//               );
//             },
//           );
//         },
//       ),

//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color.fromARGB(255, 93, 187, 152),
//         child: const Icon(Icons.add, size: 30),
//         onPressed: () async {
//           final result = await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const AddNotePage(),
//             ),
//           );

//           if (result != null && result is Company) {
//             await dbHelper.insertNote(result);
//             setState(() {}); // refresh FutureBuilder
//           }
//         },
//       ),
//     );
//   }
// }








import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/new2.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  List<Map<String, String>> notes = [];

  void addNote(String title, String note) {
    String formattedDate =
        DateFormat('dd MMM yyyy, hh:mm a').format(DateTime.now());

    setState(() {
      notes.add({
        'title': title,
        'note': note,
        'date': formattedDate,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(
          child: Text(
            'Todo',
            style: TextStyle( fontSize: 30,fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor:  Colors.teal.shade600,
      ),
      body: notes.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: Image.asset(
                      'lib/images/first.png',
                      width: 200,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'No notes yet',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(
                      notes[index]['title'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notes[index]['note'] ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          notes[index]['date'] ?? '',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Mynotes(
                                  title: notes[index]['title'],
                                  note: notes[index]['note'],
                                ),
                              ),
                            );

                            if (result != null) {
                              setState(() {
                                notes[index] = {
                                  'title': result['title'],
                                  'note': result['note'],
                                  'date': notes[index]['date']!,
                                };
                              });
                            }
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Delete Note'),
                                content: const Text(
                                    'Are you sure to delete this note?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        notes.removeAt(index);
                                      });

                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                            print('deleted');
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Mynotes()),
          );

          if (result != null) {
            addNote(result['title'], result['note']);
            print('added');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:  Colors.teal.shade600,
          fixedSize: const Size(56, 56),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.zero,
        ),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}