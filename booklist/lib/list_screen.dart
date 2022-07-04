import 'package:flutter/material.dart';
import 'package:booklist/models/book.dart';
import 'package:booklist/repositories/book_repository.dart';
import 'package:booklist/detail_screen.dart';

class ListScreen extends StatelessWidget {
  final List<Book> books = BookRepository().getBooks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Book List APP'),
        ),
        body: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return BookTile(book: books[index]);
          },
        ));
  }
}

class BookTile extends StatelessWidget {
  final Book book;
  BookTile({required this.book});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(book.title),
        leading: Image.network(book.image),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(
              book: book,
            ),
          ));
        });
  }
}
