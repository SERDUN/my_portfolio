import Project from '../../../core/models/project';

export default interface IProjectsRepository {
	get: (id: string, language: string) => Promise<Project[]>;
}
