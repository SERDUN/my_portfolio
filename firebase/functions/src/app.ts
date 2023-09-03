import 'reflect-metadata';

import * as express from 'express'
import * as cors from 'cors';
import * as bodyParser from 'body-parser';
import {inject, injectable} from 'inversify';

import UserController from './features/user/controller/user.controller';
import ProjectsController from './features/projects/controller/projectsController';
import ContactsController from "./features/contacts/controller/contacts.controller";

import ExceptionFilter from './core/errorrs/exception.filter';

import {TYPES} from './di';

@injectable()
export class App {
    app: express.Express;
    router: express.Router;

    constructor(
        @inject(TYPES.ContactsController) private readonly contactsController: ContactsController,
        @inject(TYPES.ApplicationController) private readonly userController: UserController,
        @inject(TYPES.ThemeController) private readonly themeController: ProjectsController,
        @inject(TYPES.ExceptionFilter) private readonly exceptionFilter: ExceptionFilter,
    ) {
        this.app = express();
        this.router = express.Router();
    }

    useRoutes() {
        this.app.use('/v1', this.router);

        this.router.use('/', this.contactsController.router);
        this.router.use('/', this.userController.router);
        this.router.use('/', this.themeController.router);
    }


    useMiddleware() {
        this.router.use(cors());
        this.router.use(bodyParser.json());
        this.router.use(bodyParser.urlencoded({extended: false}));
    }

    useExceptionFilter() {
        this.app.use(this.exceptionFilter.catch.bind(this.exceptionFilter))
    }

    init() {
        this.useMiddleware();
        this.useRoutes();
        this.useExceptionFilter();
    }
}
