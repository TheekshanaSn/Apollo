INSERT INTO course_unit (course_code,name,type,credit,c_lecturer_id,c_to_id)
VALUES
("ICT1212","Database Management Systems",          "T", 2,"Lec001","To001"),
("ICT1222","Database Management Systems Practicum","P", 2,"Lec001","To001"),
("ICT1233","Server-Side Web Development",          "TP",3,"Lec002","To001"),
("ICT1242","Computer Architecture",                "T", 2,"Lec002","To001"),
("ICT1253","Computer Networks",                    "TP",3,"Lec002","To001"),
("TMS1233","Discrete Mathematics",                 "T", 3,"Lec003","To001"),

("ENT1211","Workshop Technology II",               "P", 1,"Lec004","To003"),
("ENT1221","Electricity and Magnetism",            "TP",1,"Lec005","To003"),
("ENT1231","Engineering properties of matter",     "P", 1,"Lec004","To003"),
("ENT1242","Electricity and Magnetism",            "T", 2,"Lec003","TO002"),
("ENT1253","Engineering Properties of Matter",     "T", 3,"Lec005","To002"),
("TMS1213","Applied Calculus II",                  "T", 3,"Lec003","To002"),
("TMS1223","Computer Programming Techniques",      "TP",3,"Lec002","To003"),


("BST1212","Information Technology II",            "TP",2,"Lec001","To004"),
("BST1222","Electronics for Biosystems Technology","TP",2,"Lec006","To004"),
("BST1232","Organic Chemistry",                    "TP",2,"Lec007","To004"),
("BST1242","Basic Biochemistry",                   "TP",2,"Lec006","To004"),
("BST1251","BST1251 Fundamental Genetics",         "T" ,1,"Lec008","To004"),
("BST1262","Basic Microbiology",                   "TP",2,"Lec007","To004"),
("BST1272","Introduction to Fisheries Biology",    "TP",2,"Lec006","To004"),
("BST1282","Fundamentals in Agriculture",          "TP",2,"Lec008","To004"),


("ENG1222","English II",                           "T", 2,"Lec009","To005"),
("TCS1212","Fundamentals of Management",           "T", 2,"Lec010","To005");




INSERT INTO dean (dean_id,dean_nic)
VALUES
("Lec001","628776349V");




INSERT INTO lecturer(lecturer_id,department,lc_nic)
VALUES 
("Lec001","ICT","628776349V"),
("Lec002","ICT","978467895V"),
("Lec003","ET", "995123567V"),
("Lec004","ET", "986523567V"),
("Lec005","ET", "985727664V"),
("Lec006","BST","976458123V"),
("Lec007","BST","875412369V"),
("Lec008","BST","945621378V"),
("Lec009","MD", "893246517V"),
("Lec010","MD", "852369741V");
