import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants.dart';
import '../../service/spacex_service.dart';
import '../view_model/spacex_bloc.dart';
import '../widgets/loading_widget.dart';

class SpaceXView extends StatefulWidget {
  const SpaceXView({Key? key}) : super(key: key);

  @override
  State<SpaceXView> createState() => _SpaceXViewState();
}

class _SpaceXViewState extends State<SpaceXView> {
  final SpaceXBloc _bloc = SpaceXBloc(
    spaceXService: SpaceXService(Dio(BaseOptions(baseUrl: Constants.lastFlightEndPoint))),
  );

  @override
  void initState() {
    _bloc.add(GetLastFlight());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocConsumer<SpaceXBloc, SpaceXState>(
        listener: (context, state) {
          if (state is SpaceXErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(Constants.generalErrorText)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(centerTitle: true, title: const Text(Constants.appBarTitle)),
            body: state is SpaceXCompletedState ? _getBody(state) : const LoadingWidget(),
          );
        },
      ),
    );
  }

  ListView _getBody(SpaceXCompletedState state) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      children: [
        const SizedBox(height: 20.0),
        Text(
          "Name: " + (state.spaceXData.name ?? Constants.noDataText),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20.0),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            "Details: " + (state.spaceXData.details ?? Constants.noDataText),
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
        const Text("Patch:", style: TextStyle(fontSize: 20.0)),
        const SizedBox(height: 5),
        Text(
          "Large: " + (state.spaceXData.links?.patch?.large.toString() ?? Constants.noDataText),
          style: const TextStyle(fontSize: 16.0),
        ),
        Text(
          "Small: " + (state.spaceXData.links?.patch?.large.toString() ?? Constants.noDataText),
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
