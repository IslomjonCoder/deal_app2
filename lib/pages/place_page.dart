import 'dart:convert';
import 'dart:typed_data';

import 'package:deal_app/bloc/event_bloc/event_bloc.dart';
import 'package:deal_app/bloc/event_bloc/event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/meeting_card.dart';

class PlacePage extends StatelessWidget {
  const PlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 19.w, left: 19.w, top: 20.h),
      child: BlocBuilder(
          bloc: context.read<EventBloc>(),
          builder: (context, state) {
            if (state is EventLoadedState) {
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 24.h),
                itemCount: state.events.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MeetingCard(
                        time: state.events[index].date,
                        price: '${state.events[index].cost} ₽',
                        description: state.events[index].about,
                        title: state.events[index].title,
                        address: state.events[index].address,
                        image: const AssetImage('assets/images/event.png'),
                        // image: _decodeBase64Image(
                        //   state.events[index].image,
                        // ),
                      ),
                      if (index == 19) SizedBox(height: 47.h),
                    ],
                  );
                },
              );
            } else if (state is EventNotLoadedState) {
              return Center(
                child: Text(state.msg),
              );
            } else if (state is EventInitialState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is EventLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Center(
                child: Text('Unexpected Error'),
              );
            }
          }),
    );
  }

  ImageProvider _decodeBase64Image(String base64String) {
    Uint8List bytes = base64Decode(base64String);
    return MemoryImage(bytes);
  }
}
