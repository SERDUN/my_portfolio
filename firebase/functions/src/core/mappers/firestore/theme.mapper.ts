import 'reflect-metadata';

import {firestore} from 'firebase-admin';
import {injectable} from 'inversify';
import {instanceToPlain} from 'class-transformer';

import Project from '../../models/project';
@injectable()
export default class FirestoreProjectMapper {
	public toClass(data: firestore.DocumentData): Project {
		const theme = new Project();
		Object.assign(theme, data);
		return theme;
	}

	// TODO: Do better way for converting obj
	public toPlain(data: Project) {
		const plainObject: any = {};
		for (const [key, value] of Object.entries(data)) {
			if (value === undefined) {
				plainObject[key] = null;
			} else {
				plainObject[key] = value;
			}
		}
		return instanceToPlain(plainObject);
	}
}
