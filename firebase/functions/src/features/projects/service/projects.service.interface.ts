import Project from '../../../core/models/project';

export default interface IProjectsService {
    getProjects: (id: string, language: string) => Promise<Project[]>;
}
