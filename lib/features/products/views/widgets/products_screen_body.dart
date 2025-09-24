import 'package:custom_quick_alert/custom_quick_alert.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harrasi_rope_factory/core/components/custom_text_form_field.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/features/products/view_models/products_cubit/products_cubit.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/products_grid_view.dart';
import 'package:harrasi_rope_factory/features/raw_materials/views/widgets/custom_blur_title.dart';
import 'package:harrasi_rope_factory/generated/locale_keys.g.dart';

class AddProductScreenBody extends StatelessWidget {
  const AddProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();

    return SafeArea(
      child: BlocListener<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is DeleteProductFailure) {
            CustomQuickAlert.error(
              title: LocaleKeys
                  .sales_invoices_add_sales_customQuickAlert_error_title
                  .tr(),
              message: state.message,
              animationType: CustomQuickAlertAnimationType.slideInDown,
            );
          }
          if (state is DeleteProductSuccess) {
            CustomQuickAlert.success(
              title: LocaleKeys.sales_invoices_add_sales_customQuickAlert_title
                  .tr(),
              message: LocaleKeys
                  .products_delete_product_customQuickAlert_no_changes_message
                  .tr(),
              animationType: CustomQuickAlertAnimationType.scale,
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.03,
            vertical: SizeConfig.height * 0.02,
          ),
          child: Column(
            children: [
              CustomPlurTitle(
                title: LocaleKeys.products_add_product_products_title.tr(),
                icon: FontAwesomeIcons.boxOpen,
              ),
              SizedBox(height: SizeConfig.height * 0.02),
              CustomTextFormField(
                hintText: LocaleKeys.products_add_product_search_hintText.tr(),
                fillColor: Colors.transparent,
                onChanged: (value) {
                  EasyDebounce.debounce(
                    'product-search',
                    const Duration(milliseconds: 400),
                    () => cubit.searchForProducts(value.trim()),
                  );
                },
              ),
              SizedBox(height: SizeConfig.height * 0.03),
              Expanded(
                child: RefreshIndicator(
                  backgroundColor: AppColors.kThirdColor,
                  color: AppColors.kPrimaryColor,
                  onRefresh: () async => await cubit.getProducts(),
                  child: const ProductsGridView(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
