;;;=========================================================================
;;;  Author: Aysha M.R.S
;;;  Modified Date: 2023.11.15
;;;  This Expert System for 'Choosing Higher Education Paths After O/L'
;;;
;;; Disclaimer: This system serves as a guide only. 
;;;             Do more research before making a decision
;;;
;;; To execute: load, reset and run.
;;;=========================================================================
;;DEFFUNCTIONS 

(deffunction ask-question (?question)
   (printout t ?question)
   (bind ?answer (read))
   (bind ?answer (lowcase ?answer))
   ?answer)

;; QUERY RULES

(defrule determine-qualification ""
   (not (has-qualified ?))
   =>
   (assert (has-qualified ( ask-question"Are you qualified o/l? (yes/no) "))))
(defrule determine-AL ""
   (not (interest-AL ?))
   =>
   (assert (interest-AL (ask-question "Do you interest in doing A/L? (yes/no) "))))

(defrule determine-interest ""
 (interest-AL yes)  
 (not (has-interest ?))
   =>
   (assert (has-interest (ask-question "What is your career interest? (Medical/Engineering/Technology/Accounting/Teaching/Management) "))))

(defrule determine-interest-area ""
 (has-interest teaching)
(not (interest-area ?))
   =>
   (assert (interest-area (ask-question "What is your interested area? (Language/Science/Social/Commerce/Religion/Maths) "))))

(defrule determine-ability ""
(or(has-interest engineering)
(has-interest technology))
   (not (has-ability ?))
   =>
   (assert (has-ability (ask-question "What is your level in critical thinking, hard-working and enjoying deep maths/physics related things(high/less)"))))

(defrule determine-preference ""
   (interest-AL no)
   (not (ask-preference ?))
   =>
   (assert (ask-preference (ask-question "What is your Preference for Practical Skills vs. Academic Knowledge(practical/academic)"))))

(defrule determine-interest2""
   (interest-AL no)
   (not (has-interest2 ?))
   =>
   (assert (has-interest2 (ask-question "Are you Interested in Specific Trades or Professions(yes/no)"))))

;;;CONCLUSION RULES

(defrule assume-for-other ""
   (has-qualified no)
   =>
   (printout t crlf crlf)
   (printout t "Do Diploma/Certificate Courses." crlf)
   (halt))

(defrule for-practical ""
   (has-qualified yes)
   (interest-AL no)
   (ask-preference practical)
   (has-interest2 yes)
   =>
   (printout t crlf crlf)
   (printout t "you can go through Vocational Courses and Training Programs" crlf)
   (halt))
(defrule for-non-practical ""
   (has-qualified yes)
   (interest-AL no)
   (ask-preference practical)
   (has-interest2 no)
   =>
   (printout t crlf crlf)
   (printout t "you can go through Apprenticeships or Diploma Programs" crlf)
   (halt))

(defrule for-academic ""
   (has-qualified yes)
   (interest-AL no)
(ask-preference academic)
   =>
   (printout t crlf crlf)
   (printout t "You can Consider Foundation Programs leading to A/L equivalency" crlf)
   (halt))

(defrule assume-suit-for-Arts ""
  (or(and (has-qualified yes)
   (interest-AL yes)
   (has-interest teaching)
   (interest-area language))
(and (has-qualified yes)
   (interest-AL yes)
   (has-interest teaching)
   (interest-area social))
(and (has-qualified yes)
   (interest-AL yes)
   (has-interest teaching)
   (interest-area religion)))
   =>
   (printout t crlf crlf)
   (printout t "Choose Arts Stream." crlf)
   (halt))

(defrule assume-suit-for-commerce ""
  (or(and (has-qualified yes)
   (interest-AL yes)
   (has-interest accounting))
(and (has-qualified yes)
   (interest-AL yes)
   (has-interest teaching)
   (interest-area commerce))
(and (has-qualified yes)
   (interest-AL yes)
   (has-interest management)))
   =>
   (printout t crlf crlf)
   (printout t "Choose Commerce Stream." crlf)
   (halt))

(defrule assume-suit-for-btech-etech-arts ""
   (has-qualified yes)
   (interest-AL yes)
   (has-interest technology)
   (has-ability less)
   =>
   (printout t crlf crlf)
   (printout t "Choose Engineering Technology or Bio Technology or Arts stream with taking required subjects." crlf)
   (halt))

  (defrule assume-suit-for-maths-bio-tech ""
   (or(and (has-qualified yes)
   (interest-AL yes)
   (has-interest teaching)
   (interest-area science))
   (and (has-qualified yes)
   (interest-AL yes)
   (has-interest teaching)
   (interest-area maths)))
   =>
   (printout t crlf crlf)
   (printout t "Choose Physical Science or Biological Science or Bio Tech or Eng Tech Stream." crlf)
   (halt))

(defrule assume-suit-for-maths-bio ""
   (has-qualified yes)
   (interest-AL yes)
   (has-interest technology)
   (has-ability high)
   =>
   (printout t crlf crlf)
   (printout t "Choose Physical Science or Biological Science Stream." crlf)
   (halt))

(defrule assume-suit-for-Etech ""
   (has-qualified yes)
   (interest-AL yes)
   (has-interest engineering)
   (has-ability less)
   =>
   (printout t crlf crlf)
   (printout t "Choose Engineering Technology Stream." crlf)
   (halt))

(defrule assume-suit-for-maths ""
   (has-qualified yes)
   (interest-AL yes)
   (has-interest engineering)
   (has-ability high)
   =>
   (printout t crlf crlf)
   (printout t "Choose Physical Science Stream." crlf)
   (halt))

(defrule assume-suit-for-bio ""
   (has-qualified yes)
   (interest-AL yes)
   (has-interest medical)
   =>
   (printout t crlf crlf)
   (printout t "Choose Biological Science Stream." crlf)
   (halt))

;;;STARTUP AND CONCLUSION RULES

(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t " Expert System for Choosing Higher Education Paths After O/L")
  (printout t crlf crlf))

