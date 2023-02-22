// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class UserDataCollectionReference
    implements
        UserDataQuery,
        FirestoreCollectionReference<UserDataQuerySnapshot> {
  factory UserDataCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserDataCollectionReference;

  static UserData fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return UserData.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    UserData value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  UserDataDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserDataDocumentReference> add(UserData value);
}

class _$UserDataCollectionReference extends _$UserDataQuery
    implements UserDataCollectionReference {
  factory _$UserDataCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserDataCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UserDataCollectionReference.fromFirestore,
            toFirestore: UserDataCollectionReference.toFirestore,
          ),
    );
  }

  _$UserDataCollectionReference._(
    CollectionReference<UserData> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<UserData> get reference =>
      super.reference as CollectionReference<UserData>;

  @override
  UserDataDocumentReference doc([String? id]) {
    return UserDataDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserDataDocumentReference> add(UserData value) {
    return reference.add(value).then((ref) => UserDataDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserDataCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserDataDocumentReference
    extends FirestoreDocumentReference<UserDataDocumentSnapshot> {
  factory UserDataDocumentReference(DocumentReference<UserData> reference) =
      _$UserDataDocumentReference;

  DocumentReference<UserData> get reference;

  /// A reference to the [UserDataCollectionReference] containing this document.
  UserDataCollectionReference get parent {
    return _$UserDataCollectionReference(reference.firestore);
  }

  late final BarbershopCollectionReference favoriteBarbershops =
      _$BarbershopCollectionReference(
    reference,
  );

  @override
  Stream<UserDataDocumentSnapshot> snapshots();

  @override
  Future<UserDataDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String uid,
    String firstname,
    String lastname,
    String phoneNumber,
    String province,
    String instagram,
    int age,
    int haircutsDone,
    String location,
    bool vip,
  });

  Future<void> set(UserData value);
}

class _$UserDataDocumentReference
    extends FirestoreDocumentReference<UserDataDocumentSnapshot>
    implements UserDataDocumentReference {
  _$UserDataDocumentReference(this.reference);

  @override
  final DocumentReference<UserData> reference;

  /// A reference to the [UserDataCollectionReference] containing this document.
  UserDataCollectionReference get parent {
    return _$UserDataCollectionReference(reference.firestore);
  }

  late final BarbershopCollectionReference favoriteBarbershops =
      _$BarbershopCollectionReference(
    reference,
  );

  @override
  Stream<UserDataDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return UserDataDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<UserDataDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return UserDataDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? uid = _sentinel,
    Object? firstname = _sentinel,
    Object? lastname = _sentinel,
    Object? phoneNumber = _sentinel,
    Object? province = _sentinel,
    Object? instagram = _sentinel,
    Object? age = _sentinel,
    Object? haircutsDone = _sentinel,
    Object? location = _sentinel,
    Object? vip = _sentinel,
  }) async {
    final json = {
      if (uid != _sentinel) "uid": uid as String,
      if (firstname != _sentinel) "firstname": firstname as String,
      if (lastname != _sentinel) "lastname": lastname as String,
      if (phoneNumber != _sentinel) "phoneNumber": phoneNumber as String,
      if (province != _sentinel) "province": province as String,
      if (instagram != _sentinel) "instagram": instagram as String,
      if (age != _sentinel) "age": age as int,
      if (haircutsDone != _sentinel) "haircutsDone": haircutsDone as int,
      if (location != _sentinel) "location": location as String,
      if (vip != _sentinel) "vip": vip as bool,
    };

    return reference.update(json);
  }

  Future<void> set(UserData value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDataDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class UserDataDocumentSnapshot extends FirestoreDocumentSnapshot {
  UserDataDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<UserData> snapshot;

  @override
  UserDataDocumentReference get reference {
    return UserDataDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final UserData? data;
}

abstract class UserDataQuery implements QueryReference<UserDataQuerySnapshot> {
  @override
  UserDataQuery limit(int limit);

  @override
  UserDataQuery limitToLast(int limit);

  UserDataQuery whereUid({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  UserDataQuery whereFirstname({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  UserDataQuery whereLastname({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  UserDataQuery wherePhoneNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  UserDataQuery whereProvince({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  UserDataQuery whereInstagram({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  UserDataQuery whereAge({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  UserDataQuery whereHaircutsDone({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  UserDataQuery whereLocation({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  UserDataQuery whereVip({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });

  UserDataQuery orderByUid({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  });

  UserDataQuery orderByFirstname({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  });

  UserDataQuery orderByLastname({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  });

  UserDataQuery orderByPhoneNumber({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  });

  UserDataQuery orderByProvince({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  });

  UserDataQuery orderByInstagram({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  });

  UserDataQuery orderByAge({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  });

  UserDataQuery orderByHaircutsDone({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  });

  UserDataQuery orderByLocation({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  });

  UserDataQuery orderByVip({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  });
}

class _$UserDataQuery extends QueryReference<UserDataQuerySnapshot>
    implements UserDataQuery {
  _$UserDataQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<UserData> reference;

  UserDataQuerySnapshot _decodeSnapshot(
    QuerySnapshot<UserData> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return UserDataQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<UserDataDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: UserDataDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return UserDataQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<UserDataQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<UserDataQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  UserDataQuery limit(int limit) {
    return _$UserDataQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  UserDataQuery limitToLast(int limit) {
    return _$UserDataQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  UserDataQuery whereUid({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserDataQuery(
      reference.where(
        'uid',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  UserDataQuery whereFirstname({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserDataQuery(
      reference.where(
        'firstname',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  UserDataQuery whereLastname({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserDataQuery(
      reference.where(
        'lastname',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  UserDataQuery wherePhoneNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserDataQuery(
      reference.where(
        'phoneNumber',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  UserDataQuery whereProvince({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserDataQuery(
      reference.where(
        'province',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  UserDataQuery whereInstagram({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserDataQuery(
      reference.where(
        'instagram',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  UserDataQuery whereAge({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$UserDataQuery(
      reference.where(
        'age',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  UserDataQuery whereHaircutsDone({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$UserDataQuery(
      reference.where(
        'haircutsDone',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  UserDataQuery whereLocation({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserDataQuery(
      reference.where(
        'location',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  UserDataQuery whereVip({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$UserDataQuery(
      reference.where(
        'vip',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  UserDataQuery orderByUid({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('uid', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$UserDataQuery(query, _collection);
  }

  UserDataQuery orderByFirstname({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('firstname', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$UserDataQuery(query, _collection);
  }

  UserDataQuery orderByLastname({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('lastname', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$UserDataQuery(query, _collection);
  }

  UserDataQuery orderByPhoneNumber({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('phoneNumber', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$UserDataQuery(query, _collection);
  }

  UserDataQuery orderByProvince({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('province', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$UserDataQuery(query, _collection);
  }

  UserDataQuery orderByInstagram({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('instagram', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$UserDataQuery(query, _collection);
  }

  UserDataQuery orderByAge({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('age', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$UserDataQuery(query, _collection);
  }

  UserDataQuery orderByHaircutsDone({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('haircutsDone', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$UserDataQuery(query, _collection);
  }

  UserDataQuery orderByLocation({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('location', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$UserDataQuery(query, _collection);
  }

  UserDataQuery orderByVip({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('vip', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$UserDataQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserDataQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserDataQuerySnapshot
    extends FirestoreQuerySnapshot<UserDataQueryDocumentSnapshot> {
  UserDataQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<UserData> snapshot;

  @override
  final List<UserDataQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserDataDocumentSnapshot>> docChanges;
}

class UserDataQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements UserDataDocumentSnapshot {
  UserDataQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<UserData> snapshot;

  @override
  UserDataDocumentReference get reference {
    return UserDataDocumentReference(snapshot.reference);
  }

  @override
  final UserData data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class BarbershopCollectionReference
    implements
        BarbershopQuery,
        FirestoreCollectionReference<BarbershopQuerySnapshot> {
  factory BarbershopCollectionReference(
    DocumentReference<UserData> parent,
  ) = _$BarbershopCollectionReference;

  static Barbershop fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Barbershop.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Barbershop value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  /// A reference to the containing [UserDataDocumentReference] if this is a subcollection.
  UserDataDocumentReference get parent;

  @override
  BarbershopDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<BarbershopDocumentReference> add(Barbershop value);
}

class _$BarbershopCollectionReference extends _$BarbershopQuery
    implements BarbershopCollectionReference {
  factory _$BarbershopCollectionReference(
    DocumentReference<UserData> parent,
  ) {
    return _$BarbershopCollectionReference._(
      UserDataDocumentReference(parent),
      parent.collection('favoriteBarbershops').withConverter(
            fromFirestore: BarbershopCollectionReference.fromFirestore,
            toFirestore: BarbershopCollectionReference.toFirestore,
          ),
    );
  }

  _$BarbershopCollectionReference._(
    this.parent,
    CollectionReference<Barbershop> reference,
  ) : super(reference, reference);

  @override
  final UserDataDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Barbershop> get reference =>
      super.reference as CollectionReference<Barbershop>;

  @override
  BarbershopDocumentReference doc([String? id]) {
    return BarbershopDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<BarbershopDocumentReference> add(Barbershop value) {
    return reference.add(value).then((ref) => BarbershopDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$BarbershopCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class BarbershopDocumentReference
    extends FirestoreDocumentReference<BarbershopDocumentSnapshot> {
  factory BarbershopDocumentReference(DocumentReference<Barbershop> reference) =
      _$BarbershopDocumentReference;

  DocumentReference<Barbershop> get reference;

  /// A reference to the [BarbershopCollectionReference] containing this document.
  BarbershopCollectionReference get parent {
    return _$BarbershopCollectionReference(
      reference.parent.parent!.withConverter<UserData>(
        fromFirestore: UserDataCollectionReference.fromFirestore,
        toFirestore: UserDataCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<BarbershopDocumentSnapshot> snapshots();

  @override
  Future<BarbershopDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String barbershopUID,
    String name,
    double rating,
    bool vip,
    String location,
    double latitude,
    double longitude,
    String open,
    String close,
    bool isLiked,
    int fade,
    int razor,
    int scissors,
    int beard,
    int hairdryer,
    int straightener,
  });

  Future<void> set(Barbershop value);
}

class _$BarbershopDocumentReference
    extends FirestoreDocumentReference<BarbershopDocumentSnapshot>
    implements BarbershopDocumentReference {
  _$BarbershopDocumentReference(this.reference);

  @override
  final DocumentReference<Barbershop> reference;

  /// A reference to the [BarbershopCollectionReference] containing this document.
  BarbershopCollectionReference get parent {
    return _$BarbershopCollectionReference(
      reference.parent.parent!.withConverter<UserData>(
        fromFirestore: UserDataCollectionReference.fromFirestore,
        toFirestore: UserDataCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<BarbershopDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return BarbershopDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<BarbershopDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return BarbershopDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? barbershopUID = _sentinel,
    Object? name = _sentinel,
    Object? rating = _sentinel,
    Object? vip = _sentinel,
    Object? location = _sentinel,
    Object? latitude = _sentinel,
    Object? longitude = _sentinel,
    Object? open = _sentinel,
    Object? close = _sentinel,
    Object? isLiked = _sentinel,
    Object? fade = _sentinel,
    Object? razor = _sentinel,
    Object? scissors = _sentinel,
    Object? beard = _sentinel,
    Object? hairdryer = _sentinel,
    Object? straightener = _sentinel,
  }) async {
    final json = {
      if (barbershopUID != _sentinel) "barbershopUID": barbershopUID as String,
      if (name != _sentinel) "name": name as String,
      if (rating != _sentinel) "rating": rating as double,
      if (vip != _sentinel) "vip": vip as bool,
      if (location != _sentinel) "location": location as String,
      if (latitude != _sentinel) "latitude": latitude as double,
      if (longitude != _sentinel) "longitude": longitude as double,
      if (open != _sentinel) "open": open as String,
      if (close != _sentinel) "close": close as String,
      if (isLiked != _sentinel) "isLiked": isLiked as bool,
      if (fade != _sentinel) "fade": fade as int,
      if (razor != _sentinel) "razor": razor as int,
      if (scissors != _sentinel) "scissors": scissors as int,
      if (beard != _sentinel) "beard": beard as int,
      if (hairdryer != _sentinel) "hairdryer": hairdryer as int,
      if (straightener != _sentinel) "straightener": straightener as int,
    };

    return reference.update(json);
  }

  Future<void> set(Barbershop value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is BarbershopDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class BarbershopDocumentSnapshot extends FirestoreDocumentSnapshot {
  BarbershopDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Barbershop> snapshot;

  @override
  BarbershopDocumentReference get reference {
    return BarbershopDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Barbershop? data;
}

abstract class BarbershopQuery
    implements QueryReference<BarbershopQuerySnapshot> {
  @override
  BarbershopQuery limit(int limit);

  @override
  BarbershopQuery limitToLast(int limit);

  BarbershopQuery whereBarbershopUID({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarbershopQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarbershopQuery whereRating({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  BarbershopQuery whereVip({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  BarbershopQuery whereLocation({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarbershopQuery whereLatitude({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  BarbershopQuery whereLongitude({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  BarbershopQuery whereOpen({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarbershopQuery whereClose({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  BarbershopQuery whereIsLiked({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  BarbershopQuery whereFade({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  BarbershopQuery whereRazor({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  BarbershopQuery whereScissors({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  BarbershopQuery whereBeard({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  BarbershopQuery whereHairdryer({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  BarbershopQuery whereStraightener({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });

  BarbershopQuery orderByBarbershopUID({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByRating({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByVip({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByLocation({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByLatitude({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByLongitude({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByOpen({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByClose({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByIsLiked({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByFade({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByRazor({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByScissors({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByBeard({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByHairdryer({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });

  BarbershopQuery orderByStraightener({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  });
}

class _$BarbershopQuery extends QueryReference<BarbershopQuerySnapshot>
    implements BarbershopQuery {
  _$BarbershopQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Barbershop> reference;

  BarbershopQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Barbershop> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return BarbershopQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<BarbershopDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: BarbershopDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return BarbershopQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<BarbershopQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<BarbershopQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  BarbershopQuery limit(int limit) {
    return _$BarbershopQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  BarbershopQuery limitToLast(int limit) {
    return _$BarbershopQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  BarbershopQuery whereBarbershopUID({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'barbershopUID',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereRating({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'rating',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereVip({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'vip',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereLocation({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'location',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereLatitude({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'latitude',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereLongitude({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'longitude',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereOpen({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'open',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereClose({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'close',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereIsLiked({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'isLiked',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereFade({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'fade',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereRazor({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'razor',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereScissors({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'scissors',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereBeard({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'beard',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereHairdryer({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'hairdryer',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery whereStraightener({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BarbershopQuery(
      reference.where(
        'straightener',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  BarbershopQuery orderByBarbershopUID({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('barbershopUID', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByRating({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('rating', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByVip({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('vip', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByLocation({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('location', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByLatitude({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('latitude', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByLongitude({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('longitude', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByOpen({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('open', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByClose({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('close', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByIsLiked({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isLiked', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByFade({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('fade', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByRazor({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('razor', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByScissors({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('scissors', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByBeard({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('beard', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByHairdryer({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('hairdryer', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  BarbershopQuery orderByStraightener({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BarbershopDocumentSnapshot? startAtDocument,
    BarbershopDocumentSnapshot? endAtDocument,
    BarbershopDocumentSnapshot? endBeforeDocument,
    BarbershopDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('straightener', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$BarbershopQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$BarbershopQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class BarbershopQuerySnapshot
    extends FirestoreQuerySnapshot<BarbershopQueryDocumentSnapshot> {
  BarbershopQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Barbershop> snapshot;

  @override
  final List<BarbershopQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<BarbershopDocumentSnapshot>> docChanges;
}

class BarbershopQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements BarbershopDocumentSnapshot {
  BarbershopQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Barbershop> snapshot;

  @override
  BarbershopDocumentReference get reference {
    return BarbershopDocumentReference(snapshot.reference);
  }

  @override
  final Barbershop data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      json['haircutsDone'] as int,
      uid: json['uid'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      province: json['province'] as String,
      instagram: json['instagram'] as String,
      age: json['age'] as int,
      location: json['location'] as String,
      vip: json['vip'] as bool,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'uid': instance.uid,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phoneNumber': instance.phoneNumber,
      'province': instance.province,
      'instagram': instance.instagram,
      'age': instance.age,
      'haircutsDone': instance.haircutsDone,
      'location': instance.location,
      'vip': instance.vip,
    };
