import 'package:decor_app/core/utils/enums.dart';
import 'package:decor_app/features/mobile/search/presentation/blocs/search_cubit.dart';
import 'package:decor_app/features/mobile/search/presentation/blocs/search_state.dart';
import 'package:decor_app/features/mobile/search/presentation/widgets/custom_filter_search_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterSearchScreen extends StatelessWidget {
  const FilterSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state.apiSettingStatus == RequestState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.apiSettingStatus == RequestState.error) {
              return Center(child: Text(state.apiSettingErrorMessage));
            }
            return  CustomFilterSearchScreenBody();
          },
        ),
      ),
    );
  }
}
