import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/injector/injector_conf.dart';
import '../../../../core/themes/app_size.dart';
import '../../../../core/utils/get_poster_image.dart';
import '../../domain/entities/movie.dart';
import '../bloc/actor/actor_bloc.dart';
import '../widgets/loading.dart';
import '../widgets/profile_card.dart';
import '../widgets/vote_averange.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.movie});

  final Movie movie;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ActorBloc _actorBloc;

  @override
  void initState() {
    _actorBloc = getIt<ActorBloc>();
    _actorBloc.add(GetActorListEvent(id: widget.movie.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: getPosterImage(widget.movie.posterPath),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSize.s20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.originalTitle,
                    style: const TextStyle(
                      fontSize: AppSize.s26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: AppSize.s10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        height: 30,
                        width: 150,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'WHATCH NOW',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppSize.s10),
                      VoteAverage(voteAverage: widget.movie.voteAverage),
                    ],
                  ),
                  const SizedBox(height: AppSize.s10),
                  Text(
                    widget.movie.overview,
                    style: const TextStyle(
                      fontSize: AppSize.s14,
                      color: Colors.grey,
                    ),
                  ),
                  BlocBuilder<ActorBloc, ActorState>(
                      bloc: _actorBloc,
                      builder: (context, state) {
                        if (state is GetActorListSuccessState) {
                          final actors = state.actor;
                          return SizedBox(
                            height: 200,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: actors.length,
                              itemBuilder: (context, index) {
                                final actor = actors[index];
                                return ProfileCard(
                                  imageUrl:
                                      getPosterImage(actor.profilePath ?? ''),
                                  name: actor.name,
                                );
                              },
                            ),
                          );
                        }

                        return const Loading();
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
