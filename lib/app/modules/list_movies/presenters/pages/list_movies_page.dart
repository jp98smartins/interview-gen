import 'package:flutter/material.dart';
import 'package:marvel/app/core/adapters/app_svg.dart';
import 'package:marvel/app/core/theme/app_icons.dart';
import 'package:marvel/app/modules/list_movies/presenters/components/exception_component.dart';
import 'package:marvel/app/modules/list_movies/presenters/components/loading_component.dart';
import 'package:marvel/app/modules/list_movies/presenters/components/success_component.dart';
import 'package:marvel/app/modules/list_movies/presenters/states/list_movies_states.dart';
import 'package:marvel/app/modules/list_movies/presenters/store/list_movies_store.dart';
import 'package:micro_core_store/micro_core_store.dart';

final class ListMoviesPage extends StatefulWidget {
  final ListMoviesStore listMoviesStore;

  const ListMoviesPage({
    super.key,
    required this.listMoviesStore,
  });

  @override
  State<StatefulWidget> createState() => _ListMoviesPage();
}

final class _ListMoviesPage extends State<ListMoviesPage> {
  @override
  void initState() {
    super.initState();

    widget.listMoviesStore.listMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('ListMoviesPage'),
      appBar: AppBar(
        key: const Key('ListMoviesPage#AppBar'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Hero(
          tag: 'AppBarLogoHeroKey',
          transitionOnUserGestures: true,
          child: AppSvg.asset(
            AppIcons.logo,
            key: const Key('ListMoviesPage#AppBar#Title'),
            height: 35,
          ),
        ),
      ),
      body: StoreBuilder<ListMoviesStore, ListMoviesStates>(
        store: widget.listMoviesStore,
        builder: (context, state) => switch (state) {
          InitialListMoviesState() ||
          LoadingListMoviesState() =>
            const LoadingComponent(),
          ExceptionListMoviesState() => ExceptionComponent(
              exception: state.exception,
              onTryAgain: widget.listMoviesStore.listMovies,
            ),
          SuccessListMoviesState() => SuccessComponent(
              moviesList: state.moviesListEntity,
            ),
        },
      ),
    );
  }
}
