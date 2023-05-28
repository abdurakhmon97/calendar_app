import 'package:calendar_app/core/constants/assets.dart';
import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriorityColorBuilder extends StatefulWidget {
  const PriorityColorBuilder({
    Key? key,
    required this.onColorPicked,
  }) : super(key: key);
  final Function(int) onColorPicked;

  @override
  State<PriorityColorBuilder> createState() => _PriorityColorBuilderState();
}

class _PriorityColorBuilderState extends State<PriorityColorBuilder> {
  Color chosenColor = AppColorUtils.priorityColorMap[0]!;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Priority color',
          style: AppTypography.body2,
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 6,
          ),
          decoration: const BoxDecoration(
            color: AppColors.textFieldBg,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Color>(
              value: chosenColor,
              icon: Container(
                margin: const EdgeInsets.only(left: 11),
                child: SvgPicture.asset(AppIcons.chevronDown),
              ),
              onChanged: (color) {
                //overengineering to put this inside bloc
                //better handle in stateful widget
                setState(() => chosenColor = color!);
                final colorIndex = AppColorUtils.priorityColorMap.keys
                    .firstWhere((element) =>
                        AppColorUtils.priorityColorMap[element] == chosenColor);

                widget.onColorPicked(colorIndex);
              },
              items: List.generate(
                AppColorUtils.priorityColorMap.length,
                (index) {
                  final color = AppColorUtils.priorityColorMap[index]!;
                  return DropdownMenuItem(
                    value: color,
                    child: Container(
                      width: 23,
                      height: 20,
                      color: color,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
