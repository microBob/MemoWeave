// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blockViewModelHash() => r'2840391f04ebc1b1ec58198231173cf796dcbdc2';

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
    extends BuildlessAutoDisposeNotifier<BlockState> {
  late final ({DatabaseManager databaseManager, int id}) databaseProps;
  late final BlockTextEditingController blockTextEditingController;
  late final BuildContext context;
  late final void Function(TextSelection) onExtentOffsetChanged;
  late final TextSelection cursorExtentOffset;

  BlockState build({
    required ({DatabaseManager databaseManager, int id}) databaseProps,
    required BlockTextEditingController blockTextEditingController,
    required BuildContext context,
    required void Function(TextSelection) onExtentOffsetChanged,
    required TextSelection cursorExtentOffset,
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
class BlockViewModelFamily extends Family<BlockState> {
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
    required BuildContext context,
    required void Function(TextSelection) onExtentOffsetChanged,
    required TextSelection cursorExtentOffset,
  }) {
    return BlockViewModelProvider(
      databaseProps: databaseProps,
      blockTextEditingController: blockTextEditingController,
      context: context,
      onExtentOffsetChanged: onExtentOffsetChanged,
      cursorExtentOffset: cursorExtentOffset,
    );
  }

  @override
  BlockViewModelProvider getProviderOverride(
    covariant BlockViewModelProvider provider,
  ) {
    return call(
      databaseProps: provider.databaseProps,
      blockTextEditingController: provider.blockTextEditingController,
      context: provider.context,
      onExtentOffsetChanged: provider.onExtentOffsetChanged,
      cursorExtentOffset: provider.cursorExtentOffset,
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
    extends AutoDisposeNotifierProviderImpl<BlockViewModel, BlockState> {
  /// Block logic.
  ///
  /// ViewModel for [BlockWidget].
  ///
  /// Copied from [BlockViewModel].
  BlockViewModelProvider({
    required this.databaseProps,
    required this.blockTextEditingController,
    required this.context,
    required this.onExtentOffsetChanged,
    required this.cursorExtentOffset,
  }) : super.internal(
          () => BlockViewModel()
            ..databaseProps = databaseProps
            ..blockTextEditingController = blockTextEditingController
            ..context = context
            ..onExtentOffsetChanged = onExtentOffsetChanged
            ..cursorExtentOffset = cursorExtentOffset,
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
  final BuildContext context;
  final void Function(TextSelection) onExtentOffsetChanged;
  final TextSelection cursorExtentOffset;

  @override
  bool operator ==(Object other) {
    return other is BlockViewModelProvider &&
        other.databaseProps == databaseProps &&
        other.blockTextEditingController == blockTextEditingController &&
        other.context == context &&
        other.onExtentOffsetChanged == onExtentOffsetChanged &&
        other.cursorExtentOffset == cursorExtentOffset;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, databaseProps.hashCode);
    hash = _SystemHash.combine(hash, blockTextEditingController.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);
    hash = _SystemHash.combine(hash, onExtentOffsetChanged.hashCode);
    hash = _SystemHash.combine(hash, cursorExtentOffset.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  BlockState runNotifierBuild(
    covariant BlockViewModel notifier,
  ) {
    return notifier.build(
      databaseProps: databaseProps,
      blockTextEditingController: blockTextEditingController,
      context: context,
      onExtentOffsetChanged: onExtentOffsetChanged,
      cursorExtentOffset: cursorExtentOffset,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
