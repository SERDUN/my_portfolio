import 'reflect-metadata';

import {inject, injectable} from 'inversify';

import IContactsService from './contacts.service.interface';


import {TYPES} from '../../../di';
import Contact from "../../../core/models/contact";
import IContactsRepository from "../repository/contacts.repository.interface";

@injectable()
export default class ContactsService implements IContactsService {
    constructor(@inject(TYPES.ContactsRepository) private contactRepository: IContactsRepository,
    ) {
    }

    getContacts(id: string, language: string): Promise<Contact[]> {
        return this.contactRepository.getById(id, language);
    }

    //
    // getUserById(id: string): Promise<User | null> {
    //     return this.userRepository.getById(id);
    // }

}
