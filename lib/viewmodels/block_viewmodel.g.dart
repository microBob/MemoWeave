// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blockViewModelHash() => r'b51493ba4468de60503a6885032965e1980b15d4';

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
  late final ({DatabaseManager databaseManager, int id}) databaseProps;
  late final BlockTextEditingController blockTextEditingController;

  BlockCollection build({
    required ({DatabaseManager databaseManager, int id}) databaseProps,
    required BlockTextEditingController blockTextEditingController,
  });
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
  BlockViewModelProvider call({
    required ({DatabaseManager databaseManager, int id}) databaseProps,
    required BlockTextEditingController blockTextEditingController,
  }) {
    return BlockViewModelProvider(
      databaseProps: databaseProps,
      blockTextEditingController: blockTextEditingController,
    );
  }

  @override
  BlockViewModelProvider getProviderOverride(
    covariant BlockViewModelProvider provider,
  ) {
    return call(
      databaseProps: provider.databaseProps,
      blockTextEditingController: provider.blockTextEditingController,
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
  BlockViewModelProvider({
    required this.databaseProps,
    required this.blockTextEditingController,
  }) : super.internal(
          () => BlockViewModel()
            ..databaseProps = databaseProps
            ..blockTextEditingController = blockTextEditingController,
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

  final ({DatabaseManager databaseManager, int id}) databaseProps;
  final BlockTextEditingController blockTextEditingController;

  @override
  bool operator ==(Object other) {
    return other is BlockViewModelProvider &&
        other.databaseProps == databaseProps &&
        other.blockTextEditingController == blockTextEditingController;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, databaseProps.hashCode);
    hash = _SystemHash.combine(hash, blockTextEditingController.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  BlockCollection runNotifierBuild(
    covariant BlockViewModel notifier,
  ) {
    return notifier.build(
      databaseProps: databaseProps,
      blockTextEditingController: blockTextEditingController,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
