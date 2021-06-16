part of 'home_screen_cubit.dart';

class HomeScreenState extends Equatable {
  final title;

  const HomeScreenState({
    required this.title
  });

  factory HomeScreenState.init() {
    return const HomeScreenState(title: 'Hi,\nMy name is Iandi Santulus');
  }

  @override
  List<Object> get props => [title];
}

