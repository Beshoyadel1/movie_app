import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_event.dart';
import 'package:movie_app/bloc/profileBloc/DataProfile_state.dart';
import 'package:movie_app/api/ProfileApi/ProfileRepository.dart';

class DataProfileBloc extends Bloc<DataProfileEvent, DataProfileState> {
  final ProfileRepository profileRepository;

  DataProfileBloc(this.profileRepository) : super(ProfileLoading()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateAvatarId>(_onUpdateAvatarId);
    on<UpdateName>(_onUpdateName);
    on<UpdatePhoneNumber>(_onUpdatePhoneNumber);
    on<SaveProfile>(_onSaveProfile);
  }

  Future<void> _onLoadProfile(LoadProfile event, Emitter<DataProfileState> emit) async {
    emit(ProfileLoading());

    final profile = await profileRepository.fetchUserProfile();
    if (profile != null && profile.data != null) {
      emit(ProfileUpdated(
        profile.data!.name ?? 'Unknown',
        profile.data!.phone ?? 'No Phone',
        profile.data!.avatarId ?? 0,
      ));
    } else {
      emit(ProfileError("Failed to load profile data."));
    }
  }

  void _onUpdateAvatarId(UpdateAvatarId event, Emitter<DataProfileState> emit) {
    if (state is ProfileUpdated) {
      final currentState = state as ProfileUpdated;
      final newState = ProfileUpdated(currentState.name, currentState.phoneNumber, event.avatarId);
      print("Updating avatarId: ${event.avatarId}");
      print("New State: $newState"); // Debugging
      emit(newState);
    }
  }

  void _onUpdateName(UpdateName event, Emitter<DataProfileState> emit) {
    if (state is ProfileUpdated) {
      final currentState = state as ProfileUpdated;
      final newState = ProfileUpdated(event.name, currentState.phoneNumber, currentState.avatarId);

      print("Updating name: ${event.name}");
      print("New State: $newState"); // Debugging

      emit(newState);
    }
  }

  void _onUpdatePhoneNumber(UpdatePhoneNumber event, Emitter<DataProfileState> emit) {
    if (state is ProfileUpdated) {
      final currentState = state as ProfileUpdated;
      final newState = ProfileUpdated(currentState.name, event.phoneNumber, currentState.avatarId);
      print("Updating phoneNumber: ${event.phoneNumber}");
      print("New State: $newState"); // Debugging
      emit(newState);
    }
  }

  Future<void> _onSaveProfile(SaveProfile event, Emitter<DataProfileState> emit) async {
    if (state is ProfileUpdated) {
      final currentState = state as ProfileUpdated;

      print("Saving profile with name: ${currentState.name}"); // Debugging

      bool success = await profileRepository.updateProfile(
        name: currentState.name,
        phone: currentState.phoneNumber,
        avatarId: currentState.avatarId,
      );

      if (success) {
        emit(ProfileSavedSuccess());
        print("Profile saved successfully");
      } else {
        emit(ProfileError("Failed to update profile."));
      }
    }
  }
}
