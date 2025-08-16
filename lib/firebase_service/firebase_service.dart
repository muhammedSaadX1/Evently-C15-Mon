import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_c15_mon/models/category_model.dart';
import 'package:evently_c15_mon/models/event_model.dart';
import 'package:evently_c15_mon/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static Future<void> register({
    required String email,
    required String password,
    required String name,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    UserModel userModel = UserModel(
      id: credential.user!.uid,
      name: name,
      email: email,
    );
    await addUserToFireStore(userModel);
  }

  static Future<void> login({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    UserModel.currentUser = await getUserFromFireStore(credential.user!.uid);
  }

  static bool get valid => true;

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static CollectionReference<UserModel> getUsersCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserModel> usersCollection = db
        .collection("users")
        .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (userModel, _) => userModel.toJson(),
        );
    return usersCollection;
  }

  static Future<void> addUserToFireStore(UserModel user) async {
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(user.id);

    await userDocument.set(user);
  }

  static Future<UserModel> getUserFromFireStore(String uid) async {
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDocument = usersCollection.doc(uid);
    var docSnapshot = await userDocument.get();
    UserModel userModel = docSnapshot.data()!;
    return userModel;
  }

  static CollectionReference<EventModel> getEventsCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection = db
        .collection("events")
        .withConverter<EventModel>(
          fromFirestore: (snapshot, _) => EventModel.fromJson(snapshot.data()!),
          toFirestore: (eventModel, _) => eventModel.toJson(),
        );

    return eventsCollection;
  }

  static Future<void> addEventToFireStore(EventModel event) async {
    CollectionReference<EventModel> eventsCollection = getEventsCollection();
    DocumentReference<EventModel> eventDocument = eventsCollection.doc();
    event.id = eventDocument.id;
    await eventDocument.set(event);
  }

  static Future<List<EventModel>> getEventFromFireStore() async {
    CollectionReference<EventModel> eventsCollection = getEventsCollection();
    var collectionSnapshot = await eventsCollection.get();
    List<EventModel> events =
        collectionSnapshot.docs
            .map((docSnapshot) => docSnapshot.data())
            .toList();

    return events;
  }

  static Stream<List<EventModel>> getEventsFromFireStoreWithRealTime(
    CategoryModel category,
  ) async* {
    CollectionReference<EventModel> eventsCollection = getEventsCollection();
    Stream<QuerySnapshot<EventModel>> collectionSnapshots =
        eventsCollection
            .where(
              "categoryId",
              isEqualTo: category.id == "0" ? null : category.id,
            ).orderBy("dateTime")
            .snapshots();

    var events = collectionSnapshots.map(
      (querySnapshot) =>
          querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList(),
    );

    yield* events;
  }

  static addEventToFav(String uid, EventModel event)async {
    UserModel currentUser = UserModel.currentUser!;
    currentUser.favEventsIds.add(event.id);
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDoc = usersCollection.doc(uid);
    await userDoc.set(currentUser);
  }


  static Future<void> removeEventFromFav(String uid, EventModel event)async{
    UserModel currentUser = UserModel.currentUser!;
    currentUser.favEventsIds.remove(event.id);
    CollectionReference<UserModel> usersCollection = getUsersCollection();
    DocumentReference<UserModel> userDoc = usersCollection.doc(uid);
    await userDoc.set(currentUser);

  }
}
