import Contact from "../../../core/models/contact";

export default interface IContactsRepository {
    getById: (id: string, language: string) => Promise<Contact[]>;
}
