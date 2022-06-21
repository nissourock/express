const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const load = async () => {
    try {
        await prisma.student.createMany({
            data:
                [{
                    first_name: "anis",
                    last_name: "si bachir",
                    level_id: 5
                },
                {
                    first_name: "rachid",
                    last_name: "gnawi",
                    level_id: 5
                },
                {
                    first_name: "chris",
                    last_name: "rock",
                    level_id: 6
                },
                {
                    first_name: "jada ",
                    last_name: "smith",
                    level_id: 6
                },
                {
                    first_name: "latif",
                    last_name: "ben saadoun",
                    level_id: 7
                },
                {
                    first_name: "raouf ",
                    last_name: "ben derbaki",
                    level_id: 7
                },
                {
                    first_name: "anis",
                    last_name: "si bachir",
                    level_id: 8
                },
                {
                    first_name: "lotfi",
                    last_name: "bouzid",
                    level_id: 8
                }],



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
