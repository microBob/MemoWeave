// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blockViewModelHash() => r'21dd5e3e3555c2d4418e4452fe5213f0a4d18803';

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

abstract class _$BlockViewModel
    extends BuildlessAutoDisposeNotifier<BlockCollection> {
  late final ({
    int? blockId,
    BlockTextEditingController textEditingController,
    FocusNode textFieldFocusNode,
    GlobalKey<State<StatefulWidget>> textFieldKey
  }) props;

  BlockCollection build(
    ({
      int? blockId,
      BlockTextEditingController textEditingController,
      FocusNode textFieldFocusNode,
      GlobalKey<State<StatefulWidget>> textFieldKey
    }) props,
  );
}

/// Block logic.
///
/// ViewModel for [BlockWidget].
///
/// Copied from [BlockViewModel].
@ProviderFor(BlockViewModel)
const blockViewModelProvider = BlockViewModelFamily();

/// Block logic.
///
/// ViewModel for [BlockWidget].
///
/// Copied from [BlockViewModel].
class BlockViewModelFamily extends Family<BlockCollection> {
  /// Block logic.
  ///
  /// ViewModel for [BlockWidget].
  ///
  /// Copied from [BlockViewModel].
  const BlockViewModelFamily();

  /// Block logic.
  ///
  /// ViewModel for [BlockWidget].
  ///
  /// Copied from [BlockViewModel].
  BlockViewModelProvider call(
    ({
      int? blockId,
      BlockTextEditingController textEditingController,
      FocusNode textFieldFocusNode,
      GlobalKey<State<StatefulWidget>> textFieldKey
    }) props,
  ) {
    return BlockViewModelProvider(
      props,
    );
  }

  @override
  BlockViewModelProvider getProviderOverride(
    covariant BlockViewModelProvider provider,
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
  String? get name => r'blockViewModelProvider';
}

/// Block logic.
///
/// ViewModel for [BlockWidget].
///
/// Copied from [BlockViewModel].
class BlockViewModelProvider
    extends AutoDisposeNotifierProviderImpl<BlockViewModel, BlockCollection> {
  /// Block logic.
  ///
  /// ViewModel for [BlockWidget].
  ///
  /// Copied from [BlockViewModel].
  BlockViewModelProvider(
    this.props,
  ) : super.internal(
          () => BlockViewModel()..props = props,
          from: blockViewModelProvider,
          name: r'blockViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$blockViewModelHash,
          dependencies: BlockViewModelFamily._dependencies,
          allTransitiveDependencies:
              BlockViewModelFamily._allTransitiveDependencies,
        );

  final ({
    int? blockId,
    BlockTextEditingController textEditingController,
    FocusNode textFieldFocusNode,
    GlobalKey<State<StatefulWidget>> textFieldKey
  }) props;

  @override
  bool operator ==(Object other) {
    return other is BlockViewModelProvider && other.props == props;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, props.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  BlockCollection runNotifierBuild(
    covariant BlockViewModel notifier,
  ) {
    return notifier.build(
      props,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
