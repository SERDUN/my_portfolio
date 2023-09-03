import 'reflect-metadata';

import { inject, injectable} from 'inversify';
import {firestore} from 'firebase-admin';

import {admin} from '../../../config/firebase';

import IUserRepository from './user.repository.interface';

import FirestoreProjectMapper from '../../../core/mappers/firestore/theme.mapper';
import FirestoreUserMapper from '../../../core/mappers/firestore/user.mapper';


import {TYPES} from '../../../di';
import User from "../../../core/models/user";
import Skill from "../../../core/models/skill";

@injectable()
export default class UserRepository implements IUserRepository {
    private userCollection: firestore.CollectionReference;
    private skillsCollection: firestore.CollectionReference;

    constructor(
        @inject(TYPES.FirestoreThemeMapper) public themeMapper: FirestoreProjectMapper,
        @inject(TYPES.FirestoreApplicationMapper) public userMapper: FirestoreUserMapper,
    ) {
        this.userCollection = admin.firestore().collection('users');
        this.skillsCollection = admin.firestore().collection('skills');
        console.log(themeMapper);
    }


    // TODO: Handle moment when no application with id
    async getById(id: string): Promise<User | null> {
        const reference = (await this.userCollection.doc(id).get());

        if (reference.exists) {
            const data = reference.data()!;
            return data['en']
        }

        return this.userMapper.toClass(reference);
    }

   async getSkills(id: string): Promise<Skill[]> {
        const doc = this.skillsCollection.doc(id);
        const reference = await doc.get();

        if (reference.exists) {
            const data = reference.data()!;
            return data['en']
        } else {
            return [];
        }
    }
}
