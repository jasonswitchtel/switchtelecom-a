## Question 1
I am familiar with this problem, the "Foo Bar" problem.
The idea is usually to start with a for loop, and if statements to log to values, and then maybe add some flexibility to alter the output.
Something like:

````
for (let i = 1; i <= 100; i++) {
    if (i % (3*5) === 0 ) {
        console.log("Switch Telecom")
    } else if (i % 3 === 0) {
        console.log("Switch")
    } else if (i % 5 === 0) {
        console.log("Telecom")
    } else {
        console.log(i)
    }
}
````

The above loop will give the correct output, but being familiar with the problem I decided to try think of a different way to tackle it.

Looking at the example answer, I noticed that when the number outputs where no matches are found are not relevant.
So I decided to use an object to hold the output values, just focusing on the values that would match.
Now instead of using modulus to check if `i` is a multiple of x, I can use x as an interval to push values into the output object.

I created a function `pushOutput` to add a value at the interval of x between 1 and 100.
Then for the output I used a for loop to go from 1 through to 100. If the output has a key for `i` then the value is logged, otherwise the number `i` is logged.

---

## Question 2

First I want to find the position of the @ in the string, and from that select the "word" around it using the position of the space before and after.

After finding the @ and the "word" around it, I would still need to do some basic validation to ensure it is actually a email address and not just a random `@` in the input string.

The word should have the following to be a valid email
- min 2 characters before the `@`
- the following series of characters after the `@`
  - min two characters - Domain
  - a . (period)
  - min two characters - Top level domain

*I don't think email validation is the focus of this assessment, so the above should suffice, and I won't need to extend into edge-cases such as validating "find@me....m".*

Having a look at the above approach, it would lead to a lot of `strpos` and `substr` functions, which can end it somewhat hard to read code.
I think it might be better convert the string to a array first using `explode` on spaces. Then we already have the string broken up into words. I should be able to use `array_filter` to find all words containing a `@` symbol, and then from those results validate them until the first valid email is found.
*
So the process will be:
- Input a string containing zero or one email address.
- Explode string into words.
- Find words containing a `@` symbol.
- Validate these words, stop and return on first valid email, return message if none is found.


I do enjoy functional programing like in question 1, but this being php, lets create a class for this.

### Notes after writing the code:
I realised that `array_filter` would not be ideal, as I only want to find the first match and not all matches.

Instead, I used a for loop for the words, testing each word if it matches, and breaking the loop if a match is found.

---

## Question 3

### What I need to do:
- Normalize the database to 3NF
- Use appropriate datatype for columns
- Make changes that would be more practical for the use case of the data - School environment


### 1NF | 1'st normal form

#### Primary Keys:

*The primary keys are valid, but the would have to be modified if an individual's name changes*
- Remove the primary key from the name (varchar) column, and use an auto-incrementing int instead.


#### Atomicity
In both tables `subjects` does not contain atomic values
<br>To solve this we can create a subject table and two pivot tables, `subject_student` and `subject_teacher`.


### 2NF | 2'nd normal form
#### The table is in 2NF

### 3NF | 3'rd normal form
#### A transitive dependency exists with the classTeacher column.
To solve this we need to use the teachers.id to reference the teacher, and add a foreign key. I would prefer to change the name of the column to `teacher_id`, but this would depend on the existing applications for the database, it might be better to leave it as `classTeacher`.

### Further changes
- Change `students.age` to date of birth as a `DATE`.
- Change `teachers.headOfGrade` to `BOOLEAN`.
- Change `teachers.salary` to `MEDIUMINT`, it can also be unsigned.
-
- For an school/education system it would be more ideal to have separate columns for `firstname`, `lastname`, and `middlename`.

## Execution
I definitely do not know all the SQL queries to do what I want to do off by heart, so I will be making use of Google and ChatGPT.

## Notes
- The students now have their birthdate set to a date using their age, however not enough data was present to set their month and day of birth, so it has been set to the 1st of January. This would manually need to be updated. I could have just used the YEAR datatype instead, but I think a DATE should be used.
- For the `firstname`, `lastname`, and `middlename`, I used the part of the string in the existing `name` column as the `firstname`, and the rest as the `lastname`. This is because I think in South Africa people will ofter have a surname such as "van der Merwe". However, this will also require someone to go through the teachers and students to remove middle names from the `lastname` column and add it to the `middlename` column.


---

## Question 4
No specific notes on question 4.