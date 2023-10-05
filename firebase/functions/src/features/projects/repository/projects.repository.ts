import 'reflect-metadata';

import {inject, injectable} from 'inversify';
import {firestore} from 'firebase-admin';

import {admin} from '../../../config/firebase';

import IProjectsRepository from './projects.repository.interface';

import {TYPES} from '../../../di';

import FirestoreProjectMapper from '../../../core/mappers/firestore/theme.mapper';
import FirestoreUserMapper from '../../../core/mappers/firestore/user.mapper';

import Project from '../../../core/models/project';

@injectable()
export default class ProjectsRepository implements IProjectsRepository {
    private collection: firestore.CollectionReference;

    constructor(
        @inject(TYPES.FirestoreThemeMapper) public themeMapper: FirestoreProjectMapper,
        @inject(TYPES.FirestoreApplicationMapper) public applicationMapper: FirestoreUserMapper,
    ) {
        this.collection = admin.firestore().collection('projects');
    }

    async get(id: string, language: string): Promise<Project[]> {
        const doc = this.collection.doc(id);
        const reference = await doc.get();

        if (reference.exists) {
            const data = reference.data()!;
            return data[language]
        } else {
            return [];
        }
    }
}
