import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_tree/home/cubit/home_cubit.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    required this.groupValue,
    required this.value,
    required this.icon,
    super.key,
  });

  final HomeTab groupValue;
  final HomeTab value;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: groupValue == value
            ? Border.all(
                width: 2,
                color: Theme.of(context).colorScheme.primary,
              )
            : null,
      ),
      child: IconButton(
        onPressed: () => context.read<HomeCubit>().setTab(value),
        color: groupValue == value
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.secondary,
        iconSize: 32,
        icon: icon,
      ),
    );
  }
}
