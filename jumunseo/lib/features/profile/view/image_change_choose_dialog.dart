import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jumunseo/features/auth/cubit/auth_cubit.dart';

Dialog imageChangeChooseDialog(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextButton(
            onPressed: () { 
              context.read<AuthCubit>().deleteImage();
              context.pop();
            },
            child: const Text(
              '기본 사진',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () {
              context.read<AuthCubit>().postImage();
              context.pop();
            },
            child: const Text(
              '사진 선택',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
