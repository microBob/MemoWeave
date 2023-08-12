// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editorViewModelHash() => r'b5e4aa303eb49a930b8a5c5fa08937de6a442055';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$EditorViewModel
    extends BuildlessAutoDisposeAsyncNotifier<EditorState> {
  late final GlobalKey<State<StatefulWidget>> textKey;
  late final FocusNode keyboardFocusNode;
  late final TextEditingController textEditingController;
  late final int? blockId;

  FutureOr<EditorState> build(
    GlobalKey<State<StatefulWidget>> textKey,
    FocusNode keyboardFocusNode,
    TextEditingController textEditingController, [
    int? blockId,
  ]);
}

/// Text editor logic
///
/// Utilized by [EditorWidget]
///
/// Copied from [EditorViewModel].
@ProviderFor(EditorViewModel)
const editorViewModelProvider = EditorViewModelFamily();

/// Text editor logic
///
/// Utilized by [EditorWidget]
///
/// Copied from [EditorViewModel].
class EditorViewModelFamily extends Family<AsyncValue<EditorState>> {
  /// Text editor logic
  ///
  /// Utilized by [EditorWidget]
  ///
  /// Copied from [EditorViewModel].
  const EditorViewModelFamily();

  /// Text editor logic
  ///
  /// Utilized by [EditorWidget]
  ///
  /// Copied from [EditorViewModel].
  EditorViewModelProvider call(
    GlobalKey<State<StatefulWidget>> textKey,
    FocusNode keyboardFocusNode,
    TextEditingController textEditingController, [
    int? blockId,
  ]) {
    return EditorViewModelProvider(
      textKey,
      keyboardFocusNode,
      textEditingController,
      blockId,
    );
  }

  @override
  EditorViewModelProvider getProviderOverride(
    covariant EditorViewModelProvider provider,
  ) {
    return call(
      provider.textKey,
      provider.keyboardFocusNode,
      provider.textEditingController,
      provider.blockId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'editorViewModelProvider';
}

/// Text editor logic
///
/// Utilized by [EditorWidget]
///
/// Copied from [EditorViewModel].
class EditorViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<EditorViewModel, EditorState> {
  /// Text editor logic
  ///
  /// Utilized by [EditorWidget]
  ///
  /// Copied from [EditorViewModel].
  EditorViewModelProvider(
    this.textKey,
    this.keyboardFocusNode,
    this.textEditingController, [
    this.blockId,
  ]) : super.internal(
          () => EditorViewModel()
            ..textKey = textKey
            ..keyboardFocusNode = keyboardFocusNode
            ..textEditingController = textEditingController
            ..blockId = blockId,
          from: editorViewModelProvider,
          name: r'editorViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editorViewModelHash,
          dependencies: EditorViewModelFamily._dependencies,
          allTransitiveDependencies:
              EditorViewModelFamily._allTransitiveDependencies,
        );

  final GlobalKey<State<StatefulWidget>> textKey;
  final FocusNode keyboardFocusNode;
  final TextEditingController textEditingController;
  final int? blockId;

  @override
  bool operator ==(Object other) {
    return other is EditorViewModelProvider &&
        other.textKey == textKey &&
        other.keyboardFocusNode == keyboardFocusNode &&
        other.textEditingController == textEditingController &&
        other.blockId == blockId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, textKey.hashCode);
    hash = _SystemHash.combine(hash, keyboardFocusNode.hashCode);
    hash = _SystemHash.combine(hash, textEditingController.hashCode);
    hash = _SystemHash.combine(hash, blockId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<EditorState> runNotifierBuild(
    covariant EditorViewModel notifier,
  ) {
    return notifier.build(
      textKey,
      keyboardFocusNode,
      textEditingController,
      blockId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
