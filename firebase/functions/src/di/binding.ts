import {Container, ContainerModule, interfaces} from 'inversify';

import IUserRepository from '../features/user/repository/user.repository.interface';
import UserRepository from '../features/user/repository/user.repository';
import IProjectsRepository from '../features/projects/repository/projects.repository.interface';
import ProjectsRepository from '../features/projects/repository/projects.repository';

import IExceptionFilter from '../core/errorrs/exception.filter.interface';
import ExceptionFilter from '../core/errorrs/exception.filter';

import {BaseController} from '../core';
import ProjectsController from '../features/projects/controller/projectsController';
import UserController from '../features/user/controller/user.controller';

import IUserService from '../features/user/service/user.service.interface';
import UserService from '../features/user/service/user.service';
import ProjectsService from '../features/projects/service/projects.service';
import IProjectsService from '../features/projects/service/projects.service.interface';

import {TYPES} from './types';
import {App} from '../app';
import FirestoreProjectMapper from '../core/mappers/firestore/theme.mapper';
import FirestoreUserMapper from '../core/mappers/firestore/user.mapper';
import ContactsService from "../features/contacts/service/contacts.service";
import IContactsService from "../features/contacts/service/contacts.service.interface";
import ContactsController from "../features/contacts/controller/contacts.controller";
import FirestoreContactMapper from "../core/mappers/firestore/contact.mapper";
import ContactsRepository from "../features/contacts/repository/contacts.repository";
import IContactsRepository from "../features/contacts/repository/contacts.repository.interface";

const exceptionModule = new ContainerModule((bind: interfaces.Bind) => {
    bind<IExceptionFilter>(TYPES.ExceptionFilter).to(ExceptionFilter);
});


const mappersModule = new ContainerModule((bind: interfaces.Bind) => {
    bind<FirestoreUserMapper>(TYPES.FirestoreApplicationMapper).to(FirestoreUserMapper);
    bind<FirestoreProjectMapper>(TYPES.FirestoreThemeMapper).to(FirestoreProjectMapper);
    bind<FirestoreContactMapper>(TYPES.FirestoreContactMapper).to(FirestoreContactMapper);
});

const controllerModule = new ContainerModule((bind: interfaces.Bind) => {
    bind<BaseController>(TYPES.ApplicationController).to(UserController);
    bind<BaseController>(TYPES.ThemeController).to(ProjectsController);
    bind<BaseController>(TYPES.ContactsController).to(ContactsController);
});

const serviceModule = new ContainerModule((bind: interfaces.Bind) => {
    bind<IUserService>(TYPES.ApplicationsService).to(UserService);
    bind<IProjectsService>(TYPES.ThemeService).to(ProjectsService);
    bind<IContactsService>(TYPES.ContactsService).to(ContactsService);
});

const repositoryModule = new ContainerModule((bind: interfaces.Bind) => {
    bind<IProjectsRepository>(TYPES.ThemeRepository).to(ProjectsRepository).inSingletonScope();
    bind<IUserRepository>(TYPES.ApplicationRepository).to(UserRepository).inSingletonScope();
    bind<IContactsRepository>(TYPES.ContactsRepository).to(ContactsRepository).inSingletonScope();
});

const componentsModule = new ContainerModule((bind: interfaces.Bind) => {
    bind<App>(TYPES.Applications).to(App);

});

export const appContainer = new Container();

appContainer.load(mappersModule, exceptionModule, repositoryModule, controllerModule, serviceModule, componentsModule)
