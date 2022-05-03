import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/data/models/event_model.dart';
import 'package:split_it/domain/repositories/firebase_repository.dart';
import 'package:split_it/presentation/widgets/event_details/event_detail_person_tile_widget.dart';
import 'package:split_it/presentation/widgets/item_tile_widget.dart';
import 'package:split_it/shared/utils/formatters.dart';

import '../../shared/utils/store_state.dart';
import '../../theme/app_theme.dart';
import '../controllers/event_details_controller.dart';

class EventDetailsPage extends StatefulWidget {
  final EventModel event;
  const EventDetailsPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  final controller = EventDetailsController(
    firebaseRepository: FirebaseRepository(),
  );
  late ReactionDisposer _disposer;
  @override
  void initState() {
    _disposer = autorun((_) {
      if (controller.eventDetailState == StoreState.success) {
        BotToast.closeAllLoading();
        Navigator.pop(context);
        BotToast.showText(text: 'Evento excluído.');
      } else if (controller.eventDetailState == StoreState.error) {
        BotToast.closeAllLoading();
        BotToast.showText(text: 'Não foi possível deletar esse evento');
      } else if (controller.eventDetailState == StoreState.loading) {
        BotToast.showLoading();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colors.white,
      child: Scaffold(
        backgroundColor: AppTheme.colors.white,
        appBar: AppBar(
          backgroundColor: AppTheme.colors.white,
          elevation: 0,
          title: Text(
            widget.event.name,
            style: AppTheme.textStyles.appBarEventDetailsTitle,
          ),
          centerTitle: true,
          leading: BackButton(color: AppTheme.colors.backButton),
          actions: [
            IconButton(
              onPressed: () {
                controller.delete(widget.event.id);
              },
              icon: Icon(Icons.delete_outline),
              color: AppTheme.colors.backButton,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppTheme.colors.dividerDisabled,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    color: AppTheme.colors.white,
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'INTEGRANTES',
                          style: AppTheme.textStyles.eventDetailSubtitle,
                        ),
                        ...widget.event.friendsList
                            .map(
                              (e) => EventDetailPersonTileWidget(
                                event: widget.event,
                                friend: e,
                                value: widget.event.splitValue,
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: AppTheme.colors.dividerDisabled,
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  color: AppTheme.colors.white,
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'ITENS',
                        style: AppTheme.textStyles.eventDetailSubtitle,
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Divider(color: AppTheme.colors.dividerDisabled),
                      ...widget.event.itensList
                          .map(
                            (e) => ItemTileWidget(
                              name: e.name,
                              value: e.value,
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ),
              Container(
                color: AppTheme.colors.dividerDisabled,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ItemTileWidget(
                    name: 'Total',
                    value: widget.event.value,
                    hasDivider: false,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Faltam ${widget.event.remainingValue.reais()}',
                      style: AppTheme.textStyles.eventTileTitle.copyWith(
                        color: Color(0xFFE83F5B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
