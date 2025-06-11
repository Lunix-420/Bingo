import 'package:flutter/material.dart';
import 'package:frontend/model/create_room_model.dart';
import 'package:frontend/model/room_model.dart';
import 'package:frontend/services/room_service.dart';
import 'package:frontend/utils/named_logger.dart';
import 'package:frontend/widgets/appbar.dart';
import 'package:frontend/widgets/create_room/host_name.dart';
import 'package:frontend/widgets/create_room/max_players.dart';
import 'package:frontend/widgets/create_room/select_tileset.dart';
import 'package:frontend/widgets/future_loader.dart';
import 'package:frontend/widgets/view_scaffold.dart';

final logger = namedLogger("Room-Create-View");

class RoomCreateView extends StatefulWidget {
  const RoomCreateView({super.key});

  @override
  State<RoomCreateView> createState() => _RoomCreateViewState();
}

class _RoomCreateViewState extends State<RoomCreateView> {
  late CreateRoomModel createRoom = CreateRoomModel();
  late final TextEditingController hostNameController = TextEditingController();
  late final TextEditingController maxPlayersController =
      TextEditingController();

  Future<Room>? createRoomFuture;

  @override
  void initState() {
    super.initState();
    hostNameController.addListener(_handleHostNameChange);
    maxPlayersController.addListener(_handleMaxPlayersChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final model = RoomService.getCreateRoomModelFromNavigation(context);
      if (model != null) {
        setState(() {
          createRoom = model;
        });
      }
    });

    hostNameController.text = createRoom.hostName;
    maxPlayersController.text = createRoom.maxPlayers.toString();
  }

  void _handleHostNameChange() {
    setState(() {
      createRoom.hostName = hostNameController.text;
    });
  }

  void _handleMaxPlayersChange() {
    setState(() {
      createRoom.maxPlayers = int.tryParse(maxPlayersController.text) ?? 0;
    });
  }

  void _navigateListView() {
    Navigator.pushNamed(
      context,
      "/list",
      arguments: {"create-room": createRoom},
    );
  }

  void _createRoom() {
    setState(() {
      createRoomFuture = RoomService.createRoom(createRoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewScaffoldWidget(
      appbar: AppBarWidget(title: "Create Room"),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              const SizedBox(height: 16), // style only
              HostNameWidget(controller: hostNameController),
              MaxPlayersWidget(controller: maxPlayersController),
              CheckboxListTile(
                title: Text("Versus Mode"),
                value: createRoom.isVersus,
                onChanged: (bool? value) {
                  setState(() {
                    createRoom.isVersus = value ?? false;
                  });
                },
              ),
              SelectTilesetWidget(
                onSelect: _navigateListView,
                tileset: createRoom.tileset,
              ),
            ],
          ),
        ),
        createRoomFuture != null
            ? FutureLoaderWidget(
              future: createRoomFuture!,
              builder: (context, room) {
                logger.i("Room created: ${room.code}");
                Navigator.pushNamed(
                  context,
                  "/room",
                  arguments: {"room": room},
                );
                return const Text("Room created successfully!");
              },
              onError: (error) => logger.e(error),
            )
            : ElevatedButton(
              onPressed: _createRoom,
              child: Text("Create Room"),
            ),
      ],
    );
  }
}
