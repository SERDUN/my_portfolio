import 'reflect-metadata';

import {inject, injectable} from 'inversify';

import IUserService from './user.service.interface';
import IUserRepository from '../repository/user.repository.interface';

import User from '../../../core/models/user';

import {TYPES} from '../../../di';
import Skill from "../../../core/models/skill";

@injectable()
export default class UserService implements IUserService {

    constructor(@inject(TYPES.ApplicationRepository) private userRepository: IUserRepository,
    ) {
    }


    getUserById(id: string, language: string): Promise<User | null> {
        return this.userRepository.getById(id,language);
    }

    getUserSkills(id: string): Promise<Skill[]> {
        return this.userRepository.getSkills(id);
    }


}
