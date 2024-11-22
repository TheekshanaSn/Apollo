----CA eligibility view----

CREATE VIEW ca_eligibility_view AS
SELECT 
    student_id,
    course_code,
    Q1,
    Q2,
    Q3,
    assessment_mark,
    mid_exam_theory,
    mid_exam_practical,
    
    
    (GREATEST(Q1, Q2, Q3) + 
     (Q1 + Q2 + Q3 - GREATEST(Q1, Q2, Q3) - LEAST(Q1, Q2, Q3)) +
     assessment_mark + 
     mid_exam_theory + 
     mid_exam_practical) AS total_CA_marks,
     
    
    ROUND(((GREATEST(Q1, Q2, Q3) + 
            (Q1 + Q2 + Q3 - GREATEST(Q1, Q2, Q3) - LEAST(Q1, Q2, Q3)) + 
            assessment_mark + 
            mid_exam_theory + 
            mid_exam_practical) / 500) * 40, 2) AS marks_out_of_40,
           
    
    CASE 
        WHEN ROUND(((GREATEST(Q1, Q2, Q3) + 
                     (Q1 + Q2 + Q3 - GREATEST(Q1, Q2, Q3) - LEAST(Q1, Q2, Q3)) + 
                     assessment_mark + 
                     mid_exam_theory + 
                     mid_exam_practical) / 500) * 40, 2) >= 20 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS eligibility_status
FROM 
    marks;


---final marks view---
    CREATE VIEW final_marks_view AS
SELECT 
    student_id,
    course_code,
    final_exam_theory,
    final_exam_practical,

    
    CASE 
        WHEN final_exam_theory IS NOT NULL AND final_exam_practical IS NOT NULL THEN 
            (final_exam_theory + final_exam_practical)  
        WHEN final_exam_theory IS NOT NULL AND final_exam_practical = 0 THEN 
            final_exam_theory  
        WHEN final_exam_practical IS NOT NULL AND final_exam_theory = 0 THEN 
            final_exam_practical  
        ELSE 
            0 
    END AS total_final_marks,

    
    ROUND(
        CASE 
            WHEN final_exam_theory IS NOT NULL AND final_exam_practical IS NOT NULL THEN 
                ((final_exam_theory + final_exam_practical) / 200) * 60  
            WHEN final_exam_theory IS NOT NULL AND final_exam_practical = 0 THEN 
                (final_exam_theory / 100) * 60  
            WHEN final_exam_practical IS NOT NULL AND final_exam_theory = 0 THEN 
                (final_exam_practical / 100) * 60  
            ELSE 
                0  
        END, 
    2) AS marks_out_of_60 

FROM 
    marks;


---student final grades view----
    CREATE VIEW student_final_grades AS
     SELECT
         fm.student_id,
         fm.course_code,
         fm.marks_out_of_60,
         ca.marks_out_of_40,
         (fm.marks_out_of_60 + ca.marks_out_of_40) AS final_mark_out_of_100,
         CASE
             WHEN s.status = 'repeat' THEN 'C'
             WHEN s.status = 'suspended' THEN 'WH'
             ELSE
                CASE
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 85 THEN 'A+'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 80 THEN 'A'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 75 THEN 'A-'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 70 THEN 'B+'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 65 THEN 'B'
                     WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 60 THEN 'B-'
                     WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 55 THEN 'C+'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 50 THEN 'C'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 45 THEN 'C-'
                     WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 40 THEN 'D+'
                     WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 35 THEN 'D'
                    WHEN (fm.marks_out_of_60 + ca.marks_out_of_40) >= 30 THEN 'D-'
                   ELSE 'E'
               END
       END AS grade
    FROM
         final_marks_view fm
    JOIN
         ca_eligibility_view ca ON fm.student_id = ca.student_id AND fm.course_code = ca.course_code
    JOIN
         student s ON fm.student_id = s.student_id;
