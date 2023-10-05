import 'reflect-metadata';

export default class Project {
    public id?: string;
    public name?: string;
    public intro?: string;
    public description?: string;
    public linkAndroid?: string;
    public linkIOS?: string;
    public linkSource?: string;
    public spheres?: string[];
    public technologies?: string[];
    public screenshots?: string[];
    public preview?: string;
}