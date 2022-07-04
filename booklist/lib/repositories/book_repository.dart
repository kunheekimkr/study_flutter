import 'package:booklist/models/book.dart';

class BookRepository {
  final List<Book> _dummyBooks = [
    Book(
      title: 'The Lean Startup',
      subtitle:
          "How Today's Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses",
      description:
          "The Lean Startup is a new approach being adopted across the globe, changing the way companies are built and new products are launched. Eric Ries defines a startup as an organization dedicated to creating something new under conditions of extreme uncertainty. The Lean Startup approach fosters companies that are both more capital efficient and that leverage human creativity more effectively. Inspired by lessons from lean manufacturing, it relies on “validated learning”, rapid scientific experimentation, as well as a number of counter-intuitive practices that shorten product-development cycles, measure actual progress without resorting to vanity metrics, and learn what customers really want. It enables a company to shift directions with agility, altering plans inch by inch, minute by minute. Rather than wasting time creating elaborate business plans, The Lean Startup offers entrepreneurs - in companies of all sizes - a way to test their vision continuously, to adapt and adjust before it’s too late. Ries provides a scientific approach to creating and managing successful startups in a age when companies need to innovate more than ever.",
      image:
          'https://m.media-amazon.com/images/I/51Zymoq7UnL._SX258_BO1,204,203,200_.jpg',
    ),
    Book(
      title: 'The Dart Programming Language',
      subtitle: "The Definitive Guide to Dart",
      description:
          "Dart is a class-based, object-oriented language that simplifies the development of structured modern apps, scales from small scripts to large applications, and can be compiled to JavaScript for use in any modern browser. In this rigorous but readable introductory text, Dart specification lead Gilad Bracha fully explains both the language and the ideas that have shaped it.",
      image:
          'https://m.media-amazon.com/images/I/51cH0WD2rRL._AC_UY436_FMwebp_QL65_.jpg',
    ),
    Book(
        title: 'Introducing MLOps',
        subtitle: "How to Scale Machine Learning in the Enterprise",
        description:
            "More than half of the analytics and machine learning (ML) models created by organizations today never make it into production. Some of the challenges and barriers to operationalization are technical, but others are organizational. Either way, the bottom line is that models not in production can't provide business impact.",
        image:
            'https://m.media-amazon.com/images/I/61C-LT8m2yS._AC_UY436_FMwebp_QL65_.jpg'),
    Book(
      title: 'Flutter in Action',
      subtitle: "Flutter in Action",
      description:
          "Flutter in Action teaches you to build professional-quality mobile applications using the Flutter SDK and the Dart programming language. You’ll begin with a quick tour of Dart essentials and then dive into engaging, well-described techniques for building beautiful user interfaces using Flutter’s huge collection of built-in widgets. The combination of diagrams, code examples, and annotations makes learning a snap. As you go, you’ll appreciate how the author makes easy reading of complex topics like routing, state management, and async programming.",
      image:
          'https://m.media-amazon.com/images/I/71BKV6gMx5L._AC_UY436_FMwebp_QL65_.jpg',
    ),
  ];

  List<Book> getBooks() {
    return _dummyBooks;
  }
}
