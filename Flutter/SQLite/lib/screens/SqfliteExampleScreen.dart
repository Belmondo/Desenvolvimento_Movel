import 'package:flutter/material.dart';
import '../model/DatabaseService.dart';
import 'package:uuid/uuid.dart';

import '../model/MovieModel.dart';

class SqfliteExampleScreen extends StatefulWidget {
  const SqfliteExampleScreen({Key? key}) : super(key: key);
  @override
  State<SqfliteExampleScreen> createState() => _SqfliteExampleScreenState();
}

class _SqfliteExampleScreenState extends State<SqfliteExampleScreen> {
  final dbService = DatabaseService();
  final titleController = TextEditingController();
  final yearController = TextEditingController();
  final languageController = TextEditingController();
  void showBottomSheet(String functionTitle, Function()? onPressed) {
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(hintText: 'Título'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: languageController,
                    //keyboardType: TextInputType.languageress,
                    decoration: const InputDecoration(hintText: 'Língua'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: yearController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Ano'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: onPressed,
                    child: Text(functionTitle),
                  )
                ],
              ),
            ));
  }

  void addMovie() {
    showBottomSheet('Adicionar Filme', () async {
      var movie = MovieModel(
          id: Uuid().v4(),
          title: titleController.text,
          language: languageController.text,
          year: int.parse(yearController.text));
      dbService.insertMovie(movie);
      setState(() {});
      titleController.clear();
      languageController.clear();
      yearController.clear();
      Navigator.of(context).pop();
    });
  }

  void editMovie(MovieModel movie) {
    titleController.text = movie.title;
    languageController.text = movie.language;
    yearController.text = movie.year.toString();
    showBottomSheet('Update Movie', () async {
      var updatedMovie = MovieModel(
          id: movie.id,
          title: titleController.text,
          language: languageController.text,
          year: int.parse(yearController.text));
      dbService.editMovie(updatedMovie);
      titleController.clear();
      languageController.clear();
      yearController.clear();
      setState(() {});
      Navigator.of(context).pop();
    });
  }

  void deleteMovie(String id) {
    dbService.deleteMovie(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqflite Example'),
      ),
      body: FutureBuilder<List<MovieModel>>(
          future: dbService.getMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('Não há filmes encontrados'),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.yellow[200],
                  margin: const EdgeInsets.all(15),
                  child: ListTile(
                      title: Text(snapshot.data![index].title +
                          ' ' +
                          snapshot.data![index].year.toString()),
                      subtitle: Text(snapshot.data![index].language),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => editMovie(snapshot.data![index]),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  deleteMovie(snapshot.data![index].id),
                            ),
                          ],
                        ),
                      )),
                ),
              );
            }
            return const Center(
              child: Text('No Movies found'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => addMovie(),
      ),
    );
  }
}
