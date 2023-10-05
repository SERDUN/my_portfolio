import Contact from "../../../core/models/contact";

export default interface IContactsService {
    getContacts: (id: string, language: string) => Promise<Contact[]>;

}
