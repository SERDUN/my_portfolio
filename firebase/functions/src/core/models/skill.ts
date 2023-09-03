export default class Skill {
    constructor(public title: string,
                public expanded?: boolean,
                public subSkills?: Skill[],
    ) {
    }
}
