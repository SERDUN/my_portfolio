# Portfolio

## Build

* npm run build

## Deploy

* firebase deploy --only functions:nameFunction
* firebase deploy --only functions

## Config local emulator

Run in console:

    export GOOGLE_APPLICATION_CREDENTIALS="path/to/key.json"
Or in code:

    const serviceAccount = require('../../../credentials/service_account.json');

### Service account config
_[https://console.cloud.google.com/iam-admin/serviceaccounts
]()_

## Debug and Emulator

Run:

    firebase emulators:start --inspect-functions

Stop:

    lsof -t -i :7980 -i:7981 -i:7982 -i:7983 -i:7984 -i:7985 -i:7986 -i:7986 -i:9229 | xargs kill -9

### Emulator auth

```dart
import * as auth from "firebase/auth"

auth.connectAuthEmulator(auth.getAuth(), "http://127.0.0.1:7980")

```

### Firebase app in web

```dart
import * as firebase from "firebase/app"

const firebaseConfig = require('../../../credentials/firebase_config.json');

firebase.initializeApp(firebaseConfig);
```

### Get user method (for debug in general)

```dart
import {Request, Response} from "express"
import {auth} from '../config/firebase'

const getUser = async (req: Request, resp: Response) => {
    try {
        const res = await auth.signInWithEmailAndPassword(auth.getAuth(), email, pass);
        const buffer = Buffer.from(JSON.stringify(res.user), 'binary');
        return resp.status(200).json(buffer);
    } catch
        (error) {
        return resp.status(500).json(error)
    }
}

```

### Full debug firebase config

```dart
import * as firebase from "firebase/app"
import * as admin from "firebase-admin"
import * as functions from "firebase-functions"
import * as firestore from "firebase-admin/firestore"
import * as auth from "firebase/auth"

const firebaseConfig = require('../../../credentials/firebase_config.json');
const serviceAccount = require('../../../credentials/service_account.json');

firebase.initializeApp(firebaseConfig);

if (process.env.FUNCTIONS_EMULATOR === 'true') {
    auth.connectAuthEmulator(auth.getAuth(), "http://127.0.0.1:7980")
}

admin.initializeApp(serviceAccount);
const db = admin.firestore()
export {admin, functions, firestore, db, auth}
```


user