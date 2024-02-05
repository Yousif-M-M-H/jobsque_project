import 'package:choice/choice.dart';
import 'package:flutter/material.dart';

class InlineScrollableX extends StatefulWidget {
  const InlineScrollableX({super.key});

  @override
  State<InlineScrollableX> createState() => _InlineScrollableXState();
}

class _InlineScrollableXState extends State<InlineScrollableX> {
  List<String> choices = [
    'News',
    'Entertainment',
    'Politics',
    'Automotive',
    'Sports',
    'Education',
  ];

  String? selectedValue;

  void setSelectedValue(String? value) {
    setState(() => selectedValue = value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        InlineChoice<String>.multiple(
          clearable: true,
          itemCount: choices.length,
          itemBuilder: (state, i) {
            return ChoiceChip(
              showCheckmark: false,
              selected: state.selected(choices[i]),
              onSelected: state.onSelected(choices[i]),
              label: Text(choices[i]),
            );
          },
          listBuilder: ChoiceList.createWrapped(
            spacing: 10,
            runSpacing: 10,
          ),
        ),
      ],
    );
  }
}
