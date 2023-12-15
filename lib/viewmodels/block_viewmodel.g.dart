// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$blockViewModelHash() => r'8209b155ac8be3438b0129e74db66f9964eb02dc';

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

abstract class _$BlockViewModel extends BuildlessAutoDisposeNotifier<void> {
  late final ({DatabaseManager databaseManager, int id}) databaseProps;
  late final BlockTextEditingController blockTextEditingController;
  late final GlobalKey<State<StatefulWidget>> blockKey;
  late final FocusNode blockFocusNode;

  void build({
    required ({DatabaseManager databaseManager, int id}) databaseProps,
    required BlockTextEditingController blockTextEditingController,
    required GlobalKey<State<StatefulWidget>> blockKey,
    required FocusNode blockFocusNode,
  });
}

/// Block logic.
///
/// ViewModel for [BlockWidget].
/// TextField hold it's own state, so this VM is for syncing
/// the text field's state with the database.
///
/// Copied from [BlockViewModel].
@ProviderFor(BlockViewModel)
const blockViewModelProvider = BlockViewModelFamily();

/// Block logic.
///
/// ViewModel for [BlockWidget].
/// TextField hold it's own state, so this VM is for syncing
/// the text field's state with the database.
///
/// Copied from [BlockViewModel].
class BlockViewModelFamily extends Family<void> {
  /// Block logic.
  ///
  /// ViewModel for [BlockWidget].
  /// TextField hold it's own state, so this VM is for syncing
  /// the text field's state with the database.
  ///
  /// Copied from [BlockViewModel].
  const BlockViewModelFamily();

  /// Block logic.
  ///
  /// ViewModel for [BlockWidget].
  /// TextField hold it's own state, so this VM is for syncing
  /// the text field's state with the database.
  ///
  /// Copied from [BlockViewModel].
  BlockViewModelProvider call({
    required ({DatabaseManager databaseManager, int id}) databaseProps,
    required BlockTextEditingController blockTextEditingController,
    required GlobalKey<State<StatefulWidget>> blockKey,
    required FocusNode blockFocusNode,
  }) {
    return BlockViewModelProvider(
      databaseProps: databaseProps,
      blockTextEditingController: blockTextEditingController,
      blockKey: blockKey,
      blockFocusNode: blockFocusNode,
    );
  }

  @override
  BlockViewModelProvider getProviderOverride(
    covariant BlockViewModelProvider provider,
  ) {
    return call(
      databaseProps: provider.databaseProps,
      blockTextEditingController: provider.blockTextEditingController,
      blockKey: provider.blockKey,
      blockFocusNode: provider.blockFocusNode,
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
/// TextField hold it's own state, so this VM is for syncing
/// the text field's state with the database.
///
/// Copied from [BlockViewModel].
class BlockViewModelProvider
    extends AutoDisposeNotifierProviderImpl<BlockViewModel, void> {
  /// Block logic.
  ///
  /// ViewModel for [BlockWidget].
  /// TextField hold it's own state, so this VM is for syncing
  /// the text field's state with the database.
  ///
  /// Copied from [BlockViewModel].
  BlockViewModelProvider({
    required ({DatabaseManager databaseManager, int id}) databaseProps,
    required BlockTextEditingController blockTextEditingController,
    required GlobalKey<State<StatefulWidget>> blockKey,
    required FocusNode blockFocusNode,
  }) : this._internal(
          () => BlockViewModel()
            ..databaseProps = databaseProps
            ..blockTextEditingController = blockTextEditingController
            ..blockKey = blockKey
            ..blockFocusNode = blockFocusNode,
          from: blockViewModelProvider,
          name: r'blockViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$blockViewModelHash,
          dependencies: BlockViewModelFamily._dependencies,
          allTransitiveDependencies:
              BlockViewModelFamily._allTransitiveDependencies,
          databaseProps: databaseProps,
          blockTextEditingController: blockTextEditingController,
          blockKey: blockKey,
          blockFocusNode: blockFocusNode,
        );

  BlockViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.databaseProps,
    required this.blockTextEditingController,
    required this.blockKey,
    required this.blockFocusNode,
  }) : super.internal();

  final ({DatabaseManager databaseManager, int id}) databaseProps;
  final BlockTextEditingController blockTextEditingController;
  final GlobalKey<State<StatefulWidget>> blockKey;
  final FocusNode blockFocusNode;

  @override
  void runNotifierBuild(
    covariant BlockViewModel notifier,
  ) {
    return notifier.build(
      databaseProps: databaseProps,
      blockTextEditingController: blockTextEditingController,
      blockKey: blockKey,
      blockFocusNode: blockFocusNode,
    );
  }

  @override
  Override overrideWith(BlockViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: BlockViewModelProvider._internal(
        () => create()
          ..databaseProps = databaseProps
          ..blockTextEditingController = blockTextEditingController
          ..blockKey = blockKey
          ..blockFocusNode = blockFocusNode,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        databaseProps: databaseProps,
        blockTextEditingController: blockTextEditingController,
        blockKey: blockKey,
        blockFocusNode: blockFocusNode,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<BlockViewModel, void> createElement() {
    return _BlockViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BlockViewModelProvider &&
        other.databaseProps == databaseProps &&
        other.blockTextEditingController == blockTextEditingController &&
        other.blockKey == blockKey &&
        other.blockFocusNode == blockFocusNode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, databaseProps.hashCode);
    hash = _SystemHash.combine(hash, blockTextEditingController.hashCode);
    hash = _SystemHash.combine(hash, blockKey.hashCode);
    hash = _SystemHash.combine(hash, blockFocusNode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BlockViewModelRef on AutoDisposeNotifierProviderRef<void> {
  /// The parameter `databaseProps` of this provider.
  ({DatabaseManager databaseManager, int id}) get databaseProps;

  /// The parameter `blockTextEditingController` of this provider.
  BlockTextEditingController get blockTextEditingController;

  /// The parameter `blockKey` of this provider.
  GlobalKey<State<StatefulWidget>> get blockKey;

  /// The parameter `blockFocusNode` of this provider.
  FocusNode get blockFocusNode;
}

class _BlockViewModelProviderElement
    extends AutoDisposeNotifierProviderElement<BlockViewModel, void>
    with BlockViewModelRef {
  _BlockViewModelProviderElement(super.provider);

  @override
  ({DatabaseManager databaseManager, int id}) get databaseProps =>
      (origin as BlockViewModelProvider).databaseProps;
  @override
  BlockTextEditingController get blockTextEditingController =>
      (origin as BlockViewModelProvider).blockTextEditingController;
  @override
  GlobalKey<State<StatefulWidget>> get blockKey =>
      (origin as BlockViewModelProvider).blockKey;
  @override
  FocusNode get blockFocusNode =>
      (origin as BlockViewModelProvider).blockFocusNode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
