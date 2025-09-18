import 'package:date_field/date_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/generated/local_keys.g.dart';

class CustomDateTimeFormField extends StatelessWidget {
  const CustomDateTimeFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.onChanged,
  });
  final String title;
  final String hintText;
  final Function(DateTime?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.title18WhiteColor),
        SizedBox(height: SizeConfig.height * 0.003),
        DateTimeFormField(
          style: AppTextStyles.title18White.copyWith(
            color: Colors.white70,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.03,
              vertical: SizeConfig.height * 0.016,
            ),
            suffixIcon:
                Icon(Icons.calendar_month, color: AppColors.kThirdColor),
            hintText: LocaleKeys
                .sales_invoices_add_sales_customDateTimeFormField_hintText
                .tr(),
            hintStyle: AppTextStyles.title16Grey,
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
            errorBorder: buildBorder(),
            focusedErrorBorder: buildBorder(),
            iconColor: AppColors.kThirdColor,
          ),
          canClear: false,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          initialPickerDateTime: DateTime.now(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.kThirdColor),
    );
  }
}
