const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
const bcrypt = require('bcrypt');
const load = async () => {
    try {
        await prisma.student.createMany({
            data:
                [{
                    first_name: "amine",
                    last_name: "tahri",
                    level_id: 1,
                    password: bcrypt.hashSync("metallica", 10),
                },
                {
                    first_name: "riad",
                    last_name: "mahrez",
                    level_id: 1,
                    password: bcrypt.hashSync("megadeth", 10),

                },
                {
                    first_name: "love",
                    last_name: "galore",
                    level_id: 3,
                    password: bcrypt.hashSync("wintersun", 10),

                },
                {
                    first_name: "pantheon",
                    last_name: "daniels",
                    level_id: 1,
                    password: bcrypt.hashSync("davidson", 10),

                },
                {
                    first_name: "lust",
                    last_name: "ben saadoun",
                    level_id: 2,
                    password: bcrypt.hashSync("12345678", 10),

                },
                {
                    first_name: "raouf ",
                    last_name: "ben derbaki",
                    level_id: 2,
                    password: bcrypt.hashSync("camel", 10),

                },
                {
                    first_name: "anis",
                    last_name: "si bachir",
                    level_id: 3,
                    password: bcrypt.hashSync("azerty", 10),

                },
                {
                    first_name: "lotfi",
                    last_name: "bouzid",
                    level_id: 1,
                    password: bcrypt.hashSync("rrrrrr", 10),

                }],



        })

    } catch (e) {
        console.error(e);
        // eslint-disable-next-line no-undef
        process.exit(1);
    } finally {
        console.log("added successfully")
        await prisma.$disconnect();
    }
}
load();
