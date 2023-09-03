import 'reflect-metadata';

import {NextFunction, Request, Response} from 'express';
import {inject, injectable} from 'inversify';

import {BaseController} from '../../../core';
import IProjectsService from '../service/projects.service.interface';

import {TYPES} from '../../../di';

@injectable()
export default class ProjectsController extends BaseController {
    themesService: IProjectsService;

    constructor(
        @inject(TYPES.ThemeService) projectsService: IProjectsService,
    ) {
        super();
        this.themesService = projectsService;
        this.bindRoute([
            {
                path: '/projects',
                method: 'get',
                func: this.getProjects,
            },
        ],)
    }

    async getProjects(req: Request, res: Response, _: NextFunction) {
        const userId: string = req.header("x-user-id")??'';
        const language: string = req.header("accept-language") ?? 'en';

        const data = await this.themesService.getProjects(userId,language);
        this.ok(res, data);
    }
}
