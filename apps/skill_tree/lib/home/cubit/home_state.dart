part of 'home_cubit.dart';

enum HomeTab {
  tasks,
  activities,
  skills,
  stats,
  logs,
  settings,
}

final class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.tasks,
  });

  final HomeTab tab;

  @override
  List<Object?> get props => [tab];
}
