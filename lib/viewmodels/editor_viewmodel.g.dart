// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editorViewModelHash() => r'9061d2226ac50f44ac94148e50ac635fb64e38ca';

/// Text editor logic
///
/// Utilized by [EditorWidget]
///
/// Copied from [EditorViewModel].
@ProviderFor(EditorViewModel)
final editorViewModelProvider =
    AutoDisposeNotifierProvider<EditorViewModel, EditorState>.internal(
  EditorViewModel.new,
  name: r'editorViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$editorViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EditorViewModel = AutoDisposeNotifier<EditorState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
