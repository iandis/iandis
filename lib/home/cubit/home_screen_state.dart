part of 'home_screen_cubit.dart';

class HomeScreenState extends Equatable {
  final title;
  final List<Certificate> certificates;

  const HomeScreenState({
    required this.title,
    required this.certificates,
  });

  factory HomeScreenState.init() {
    return HomeScreenState(
      title: 'Hi,\nMy name is Iandi Santulus',
      certificates: [
        Certificate.dicoding(
          title: 'Belajar Fundamental Aplikasi Flutter',
          url: 'https://www.dicoding.com/certificates/NVP7GELWWXR0',
        ),
        Certificate.dicoding(
          title: 'Belajar Membuat Aplikasi Flutter untuk Pemula',
          url: 'https://www.dicoding.com/certificates/L4PQMJQ67ZO1',
        ),
        Certificate.dicoding(
          title: 'Belajar Prinsip Pemrograman SOLID',
          url: 'https://www.dicoding.com/certificates/GRX5GE942X0M',
        ),
        Certificate.dicoding(
          title: 'Memulai Pemrograman Dengan Dart',
          url: 'https://www.dicoding.com/certificates/1OP8DE5M2PQK',
        ),
        Certificate.dicoding(
          title: 'Belajar Membangun LINE Chatbot',
          url: 'https://www.dicoding.com/certificates/4EXGYKEN9XRL',
        ),
      ],
    );
  }

  @override
  List<Object> get props => [title, certificates];
}

