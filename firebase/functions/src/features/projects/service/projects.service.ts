import 'reflect-metadata';

import {inject, injectable} from 'inversify';

import IProjectsRepository from '../repository/projects.repository.interface';
import IProjectsService from './projects.service.interface';

import {TYPES} from '../../../di';

import Project from '../../../core/models/project';

@injectable()
export default class ProjectsService implements IProjectsService {
    constructor(
        @inject(TYPES.ThemeRepository) private projectsRepository: IProjectsRepository,
    ) {
    }

    getProjects(id: string, language: string): Promise<Project[]> {
        return this.projectsRepository.get(id, language);
    }

}
