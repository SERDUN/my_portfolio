import 'reflect-metadata';

import {inject, injectable} from 'inversify';
import {NextFunction, Request, Response} from 'express';

import {BaseController} from '../../../core';

import UserService from '../service/user.service';

import {TYPES} from '../../../di';

@injectable()
export default class UserController extends BaseController {

    constructor(
        @inject(TYPES.ApplicationsService) protected userService: UserService
    ) {
        super();
        this.bindRoute([
            {
                path: '/user',
                method: 'get',
                func: this.getUser,
                middlewares: []
            },
            {
                path: '/skills',
                method: 'get',
                func: this.getSkills,
                middlewares: []
            }
        ],)
    }

    async getUser(req: Request, res: Response, _: NextFunction) {
        // TODO: add validation
        // @ts-ignore
        const userId: string = req.header("x-user-id");
        const language: string = req.header("accept-language") ?? "en";
        const data = await this.userService.getUserById(userId, language);
        this.ok(res, data);
    }

    async getSkills(req: Request, res: Response, _: NextFunction) {
        // TODO: add validation
        // @ts-ignore
        const userId: string = req.header("x-user-id");
        const data = await this.userService.getUserSkills(userId);
        this.ok(res, data);
    }
}
