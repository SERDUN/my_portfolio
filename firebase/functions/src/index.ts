import {App} from './app';
import {TYPES} from './di';
import {https} from 'firebase-functions';
import {appContainer} from './di/binding';

const app = appContainer.get<App>(TYPES.Applications);
app.init();

export const api = https.onRequest(app.app);
