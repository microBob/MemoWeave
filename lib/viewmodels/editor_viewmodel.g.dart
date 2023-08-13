// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editorViewModelHash() => r'8b4ead135a9179cf29cd3e44e1222ab2672ba2e7';

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

abstract class _$EditorViewModel extends BuildlessAutoDisposeAsyncNotifier<
    ({EdgeInsets cursorInsets, BlockCollection rootBlock})> {
  late final ({
    int? blockId,
    FocusNode keyboardFocusNode,
    TextEditingController textEditingController,
    GlobalKey<State<StatefulWidget>> textKey
  }) props;

  FutureOr<({EdgeInsets cursorInsets, BlockCollection rootBlock})> build(
    ({
      int? blockId,
      FocusNode keyboardFocusNode,
      TextEditingController textEditingController,
      GlobalKey<State<StatefulWidget>> textKey
    }) props,
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
class EditorViewModelFamily extends Family<
    AsyncValue<({EdgeInsets cursorInsets, BlockCollection rootBlock})>> {
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
    ({
      int? blockId,
      FocusNode keyboardFocusNode,
      TextEditingController textEditingController,
      GlobalKey<State<StatefulWidget>> textKey
    }) props,
  ) {
    return EditorViewModelProvider(
      props,
    );
  }

  @override
  EditorViewModelProvider getProviderOverride(
    covariant EditorViewModelProvider provider,
  ) {
    return call(
      provider.props,
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
class EditorViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    EditorViewModel, ({EdgeInsets cursorInsets, BlockCollection rootBlock})> {
  /// Text editor logic
  ///
  /// Utilized by [EditorWidget]
  ///
  /// Copied from [EditorViewModel].
  EditorViewModelProvider(
    this.props,
  ) : super.internal(
          () => EditorViewModel()..props = props,
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

  final ({
    int? blockId,
    FocusNode keyboardFocusNode,
    TextEditingController textEditingController,
    GlobalKey<State<StatefulWidget>> textKey
  }) props;

  @override
  bool operator ==(Object other) {
    return other is EditorViewModelProvider && other.props == props;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, props.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<({EdgeInsets cursorInsets, BlockCollection rootBlock})>
      runNotifierBuild(
    covariant EditorViewModel notifier,
  ) {
    return notifier.build(
      props,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
