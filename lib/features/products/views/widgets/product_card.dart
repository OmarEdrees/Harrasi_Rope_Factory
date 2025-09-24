import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harrasi_rope_factory/core/utilies/assets/images/app_images.dart';
import 'package:harrasi_rope_factory/core/utilies/colors/app_colors.dart';
import 'package:harrasi_rope_factory/core/utilies/sizes/sized_config.dart';
import 'package:harrasi_rope_factory/core/utilies/styles/app_text_styles.dart';
import 'package:harrasi_rope_factory/features/products/models/product_model.dart';
import 'package:harrasi_rope_factory/features/products/view_models/edit_product_cubit/edit_product_cubit.dart';
import 'package:harrasi_rope_factory/features/products/view_models/products_cubit/products_cubit.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/delete_and_edit_menu_button.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/edit_product_modal_bottom_sheet_body.dart';
import 'package:harrasi_rope_factory/features/products/views/widgets/product_details_modal_bottom_sheet_body.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.productModel,
    super.key,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final GlobalKey btnKey = GlobalKey();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.kPrimaryColor,
          builder: (context) {
            return ProductDetailsModalBottomSheetBody(
              productModel: productModel,
            );
          },
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.antiAlias,
            children: [
              SizedBox(
                height: SizeConfig.height * 0.18,
                width: double.infinity,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: productModel.image != null &&
                          productModel.image!.isNotEmpty
                      ? Image.network(
                          productModel.image!,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          AppImages.noProductImage,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: DeleteAndEditMenuButton(
                  btnKey: btnKey,
                  iconColor: AppColors.kPrimaryColor,
                  onDeleteTap: () {
                    context
                        .read<ProductsCubit>()
                        .deleteProduct(id: productModel.id);
                  },
                  onEditTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: AppColors.kPrimaryColor,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      builder: (context) {
                        return BlocProvider(
                          create: (context) =>
                              EditProductCubit(product: productModel),
                          child: EditProductModalBottomSheetBody(
                              productModel: productModel),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.height * 0.01),
          Text(
            productModel.name,
            style: AppTextStyles.title18White,
          ),
        ],
      ),
    );
  }
}
