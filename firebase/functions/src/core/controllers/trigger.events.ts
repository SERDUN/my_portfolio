import {firestore} from 'firebase-admin';
import {EventContext} from 'firebase-functions';

export type OnCreate = (snapshot: firestore.QueryDocumentSnapshot, context: EventContext) => PromiseLike<any> | any;
