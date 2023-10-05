import User from "../../../core/models/user";
import Skill from "../../../core/models/skill";

export default interface IUserRepository {
	getById: (id: string, language: string) => Promise<User | null>;
	getSkills: (id: string) => Promise<Skill[]>;
}
