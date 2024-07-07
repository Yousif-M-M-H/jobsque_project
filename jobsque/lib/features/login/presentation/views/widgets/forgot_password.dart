import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jobsque/core/storage/token_storage.dart';
import 'package:jobsque/core/utils/app_router.dart';
import 'package:jobsque/core/utils/styles.dart';

class ForgotPasswordRow extends StatefulWidget {
  const ForgotPasswordRow({super.key});

  @override
  State<ForgotPasswordRow> createState() => _ForgotPasswordRowState();
}

class _ForgotPasswordRowState extends State<ForgotPasswordRow> {
  bool _isChecked = false;
  final TokenStorage _tokenStorage = TokenStorage();

  @override
  void initState() {
    super.initState();
    _loadRememberMeState();
  }

  Future<void> _loadRememberMeState() async {
    final bool rememberMeFlag = await _tokenStorage.getRememberMeFlag();
    setState(() {
      _isChecked = rememberMeFlag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) async {
                setState(() {
                  _isChecked = value ?? false;
                });
                await _tokenStorage.saveRememberMeFlag(_isChecked);
              },
            ),
            Text(
              'Remember me',
              style: AppStyles.normalFont16.copyWith(fontSize: 14),
            ),
          ],
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kforgotPassword);
          },
          child: const Text(
            "Forgot Password?",
            style: AppStyles.normalFont14,
          ),
        ),
      ],
    );
  }
}
