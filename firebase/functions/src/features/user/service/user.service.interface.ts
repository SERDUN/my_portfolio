import User from "../../../core/models/user";
import Skill from "../../../core/models/skill";

export default interface IUserService {
    getUserById: (id: string) => Promise<User | null>;
    getUserSkills: (id: string) => Promise<Skill[]>;

}
