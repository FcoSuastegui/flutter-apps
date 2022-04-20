import 'package:flutter/material.dart';
import 'package:flutter_apps/src/data/model/project.dart';
import 'package:flutter_apps/src/data/usecase/project.dart';
import 'package:flutter_apps/src/presentation/views/home/cubit/home_cubit.dart';
import 'package:flutter_apps/src/presentation/widgets/cards/project_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/';
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/home/images/profile.jpeg'),
            ),
          ),
        ),
        title: Text(
          "Apps Projects",
          style: GoogleFonts.poppins(
            color: const Color(0xff001800),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: FlutterLogo(size: 25),
          )
        ],
      ),
      body: BlocProvider(
        create: (_) => HomeCubit(
          pagingController: PagingController(firstPageKey: 1),
          projectUse: ProjectUseCase(),
        )..init(),
        child: BlocBuilder<HomeCubit, int>(
          builder: (context, state) {
            final cubit = context.read<HomeCubit>();
            final pagingController = cubit.pagingController;

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 0)),
                PagedSliverList.separated(
                  pagingController: pagingController,
                  builderDelegate: PagedChildBuilderDelegate<ProjectModel>(
                    itemBuilder: (context, project, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: ProjectCard(index: index, project: project),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 0,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
