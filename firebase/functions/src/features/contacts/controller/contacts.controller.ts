import 'reflect-metadata';

import {inject, injectable} from 'inversify';
import {NextFunction, Request, Response} from 'express';

import {BaseController} from '../../../core';

import ContactsService from '../service/contacts.service';

import {TYPES} from '../../../di';

@injectable()
export default class ContactsController extends BaseController {

    constructor(
        @inject(TYPES.ContactsService) protected contactsService: ContactsService
    ) {
        super();
        this.bindRoute([
            {
                path: '/contacts',
                method: 'get',
                func: this.getContacts,
                middlewares: []
            }
        ],)
    }

    async getContacts(req: Request, res: Response, _: NextFunction) {
        console.log("getContacts success");

        // TODO: add validation
        // @ts-ignore
        const contactsId: string = req.header("x-user-id");
        const language: string = req.header("accept-language") ?? 'en';
        const data = await this.contactsService.getContacts(contactsId, language);
        this.ok(res, data);
    }
}
