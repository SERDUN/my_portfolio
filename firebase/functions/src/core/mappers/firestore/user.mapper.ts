import 'reflect-metadata';
import {plainToClass} from 'class-transformer';


import {firestore} from 'firebase-admin';
import {injectable} from 'inversify';
import {instanceToPlain} from 'class-transformer';

import User from "../../models/user";

@injectable()
export default class FirestoreUserMapper {
    public toClass(reference: firestore.DocumentSnapshot): User {
        const data = reference.data()! as Map<string, any>;
        const user = plainToClass(User, data);
        user.id = reference.id;
        return user;
    }

    // TODO: Do better way for converting obj
    public toPlain(data: User) {
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
