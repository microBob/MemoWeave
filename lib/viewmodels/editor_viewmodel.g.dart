// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editorViewModelHash() => r'e17c3abcbb7bad838457da194a3f05f854d734aa';

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
    extends BuildlessAutoDisposeNotifier<EditorState> {
  late final GlobalKey<State<StatefulWidget>> textKey;
  late final FocusNode inputFocusNode;

  EditorState build(
    GlobalKey<State<StatefulWidget>> textKey,
    FocusNode inputFocusNode,
  );
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
class EditorViewModelFamily extends Family<EditorState> {
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
    FocusNode inputFocusNode,
  ) {
    return EditorViewModelProvider(
      textKey,
      inputFocusNode,
    );
  }

  @override
  EditorViewModelProvider getProviderOverride(
    covariant EditorViewModelProvider provider,
  ) {
    return call(
      provider.textKey,
      provider.inputFocusNode,
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
    extends AutoDisposeNotifierProviderImpl<EditorViewModel, EditorState> {
  /// Text editor logic
  ///
  /// Utilized by [EditorWidget]
  ///
  /// Copied from [EditorViewModel].
  EditorViewModelProvider(
    this.textKey,
    this.inputFocusNode,
  ) : super.internal(
          () => EditorViewModel()
            ..textKey = textKey
            ..inputFocusNode = inputFocusNode,
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
  final FocusNode inputFocusNode;

  @override
  bool operator ==(Object other) {
    return other is EditorViewModelProvider &&
        other.textKey == textKey &&
        other.inputFocusNode == inputFocusNode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, textKey.hashCode);
    hash = _SystemHash.combine(hash, inputFocusNode.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  EditorState runNotifierBuild(
    covariant EditorViewModel notifier,
  ) {
    return notifier.build(
      textKey,
      inputFocusNode,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
