const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const load = async () => {
    try {
        await prisma.prof.createMany({
            data:
                [{
                   first_name:"Hamid",
                   last_name: "Ben debka",
                   course_teached: 1,
                   level_teached :1
                },
                {
                   first_name:"Amina",
                   last_name: "Chriti",
                   course_teached: 2,
                   level_teached :1
                },
                {
                   first_name:"Souad",
                   last_name: "Si Hamadi",
                   course_teached: 3,
                   level_teached :2
                },
                {
                   first_name:"Raouf",
                   last_name: "Legraz",
                   course_teached: 3,
                   level_teached :2
                },
                {
                   first_name:"Melissa",
                   last_name: "Selami",
                   course_teached: 1,
                   level_teached :3
                }
                ],



        })

    } catch (e) {
        console.error(e);
        process.exit(1);
    } finally {
        console.log("added successfully")
        await prisma.$disconnect();
    };
}
load();
