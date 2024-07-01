import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hogwarts_college_app/core/models/event_model.dart';
import 'package:hogwarts_college_app/features/admin/data/repos/admin_repo_impl.dart';
import 'package:image_picker/image_picker.dart';

part 'events_state.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(AdminInitial());

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  XFile? eventImage;
  String eventLocation = 'House Of Gryffindor';
  void pickEventImage() async {
    eventImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(EventImagePicked());
  }

  void pickEventLocation(String location) {
    eventLocation = location;
    emit(EventLocationPicked());
  }

  Future uploadEventData(BuildContext context) async {
    emit(UploadEventDataLoading());

    try {
      await AdminRepoImpl().uploadEventData(
        context,
        EventModel(
          name: titleController.text,
          date: dateController.text,
          time: timeController.text,
          location: eventLocation,
          image: eventImage!.path,
        ),
      );
      emit(UploadEventDataSuccess());
    } catch (e) {
      emit(UploadEventDataError());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'there was an error , try again later',
            style: TextStyle(color: Colors.white),
          ),
        ));
      }
    }
  }
}
