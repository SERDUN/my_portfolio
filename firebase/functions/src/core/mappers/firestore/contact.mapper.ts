import 'reflect-metadata';
import {instanceToPlain, plainToClass} from 'class-transformer';


import {firestore} from 'firebase-admin';
import {injectable} from 'inversify';
import Contact from "../../models/contact";

@injectable()
export default class FirestoreContactMapper {
    public toClass(reference: firestore.DocumentSnapshot): Contact {
        const data = reference.data()! as Map<string, any>;
        return plainToClass(Contact, data);
    }

    // TODO: Do better way for converting obj
    public toPlain(data: Contact) {
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
