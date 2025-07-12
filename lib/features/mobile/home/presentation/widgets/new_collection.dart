import 'package:decor_app/core/responsive/responsive_helper.dart';
import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/features/mobile/home/presentation/blocs/home_cubit.dart';
import 'package:decor_app/core/widget/custom_new_collection_grid_view.dart';
import 'package:decor_app/features/mobile/home/presentation/widgets/custom_new_collection_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewCollection extends StatelessWidget {
  const NewCollection({super.key});

  @override
  Widget build(BuildContext context) {
    final res = ResponsiveHelper(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.collectionState) {
          case RequestState.initial:
            return const SizedBox.shrink();
          case RequestState.loading:
            return CustomNewCollectionShimmer(res: res);

          case RequestState.loaded:
            return CustomNewCollectionGridView(
              res: res,
              collectionItems: state.collectionItems,
            );

          case RequestState.error:
            return Center(
              child: Text(
                'Error loading data',
                style: TextStyle(color: Colors.red.shade400),
              ),
            );
        }
      },
    );
  }
}
