import 'reflect-metadata';

import {inject, injectable} from 'inversify';
import {firestore} from 'firebase-admin';

import {admin} from '../../../config/firebase';

import IContactsRepository from './contacts.repository.interface';


import {TYPES} from '../../../di';
import Contact from "../../../core/models/contact";
import FirestoreContactMapper from "../../../core/mappers/firestore/contact.mapper";

@injectable()
export default class ContactsRepository implements IContactsRepository {
    private collection: firestore.CollectionReference;

    constructor(
        @inject(TYPES.FirestoreContactMapper) public contactMapper: FirestoreContactMapper,
    ) {
        this.collection = admin.firestore().collection('contacts');
    }


    // TODO: Handle moment when no application with id
    async getById(id: string, language: string): Promise<Contact[]> {
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
