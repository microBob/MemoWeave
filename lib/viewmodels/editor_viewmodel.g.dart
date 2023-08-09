// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchDatabaseHash() => r'7b38397980585dddb95e77ca2bf57e6a4731ea02';

/// See also [fetchDatabase].
@ProviderFor(fetchDatabase)
final fetchDatabaseProvider = AutoDisposeFutureProvider<String>.internal(
  fetchDatabase,
  name: r'fetchDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchDatabaseRef = AutoDisposeFutureProviderRef<String>;

String _$editorViewModelHash() => r'd0e1ed09bcc718af21845d36eb3003e7cd007896';

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

  EditorState build(
    GlobalKey<State<StatefulWidget>> textKey,
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
  ) {
    return EditorViewModelProvider(
      textKey,
    );
  }

  @override
  EditorViewModelProvider getProviderOverride(
    covariant EditorViewModelProvider provider,
  ) {
    return call(
      provider.textKey,
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
  ) : super.internal(
          () => EditorViewModel()..textKey = textKey,
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

  @override
  bool operator ==(Object other) {
    return other is EditorViewModelProvider && other.textKey == textKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, textKey.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  EditorState runNotifierBuild(
    covariant EditorViewModel notifier,
  ) {
    return notifier.build(
      textKey,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
