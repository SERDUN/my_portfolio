import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'
import * as firestore from 'firebase-admin/firestore'

// TODO: Add auto env detecting
// import * as auth from "firebase/auth"
// import * as firebase from "firebase/app"

// const firebaseConfig = require('../../../../../../../resources/credentials/portfolio_service_config.json');
// const serviceAccount = require('../../../../../../../resources/credentials/portfolio_service_account.json');

// firebase.initializeApp(firebaseConfig);

// auth.connectAuthEmulator(auth.getAuth(), 'http://127.0.0.1:7980')
admin.initializeApp();


// admin.initializeApp();
// const database = admin.firestore()
export {admin, functions, firestore}