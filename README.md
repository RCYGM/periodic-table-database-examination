# Periodic Table Database Examination #4

[View full path here](https://github.com/RCYGM/relational-database-projects)

This project demonstrates my ability to design, manage, and query a relational database representing the periodic table of elements using PostgreSQL and Bash. Through this examination, my skills in database normalization, task automation, and creating user-friendly interactions were evaluated.

---

## **Requirements Completed**

### **Database Modifications**

1. **Renaming Columns:**
   - The `weight` column was renamed to `atomic_mass`.
   - The `melting_point` and `boiling_point` columns were renamed to `melting_point_celsius` and `boiling_point_celsius`, respectively.

2. **Constraints Added:**
   - The `melting_point_celsius` and `boiling_point_celsius` columns were set to `NOT NULL`.
   - `UNIQUE` constraints were added to the `symbol` and `name` columns in the `elements` table.
   - The `symbol` and `name` columns were set to `NOT NULL`.

3. **Relationships Established:**
   - The `atomic_number` column in the `properties` table was set as a foreign key referencing the `atomic_number` column in the `elements` table.

4. **New `types` Table:**
   - A new `types` table was created with the following columns:
     - `type_id` (primary key, integer).
     - `type` (VARCHAR, `NOT NULL`).
   - Three rows were added to the `types` table with the values `metal`, `nonmetal`, and `metalloid`.

5. **Properties Table Updated:**
   - A new `type_id` column was added as a foreign key referencing the `type_id` column in the `types` table, with a `NOT NULL` constraint.
   - Each row in the `properties` table was updated to associate with the correct `type_id` from the `types` table.

6. **Data Corrections:**
   - The first letter of all symbols in the `elements` table was capitalized.
   - Trailing zeros were removed from all values in the `atomic_mass` column. The data type was updated to `DECIMAL` to enable this change.

7. **Elements Added:**
   - Element with atomic number 9:
     - Name: Fluorine
     - Symbol: F
     - Mass: 18.998
     - Melting Point: -220 °C
     - Boiling Point: -188.1 °C
     - Type: nonmetal
   - Element with atomic number 10:
     - Name: Neon
     - Symbol: Ne
     - Mass: 20.18
     - Melting Point: -248.6 °C
     - Boiling Point: -246.1 °C
     - Type: nonmetal

8. **Data Cleanup:**
   - Removed the nonexistent element with `atomic_number = 1000` from the `elements` and `properties` tables.
   - Removed the redundant `type` column from the `properties` table.

---

### **Bash Automation**

1. **Script `element.sh`:**
   - This script accepts an argument (atomic number, symbol, or name) and queries the database to return information about the corresponding element.
   - Output examples:
     - For valid input:
       ```
       The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
       ```
     - For invalid input:
       ```
       I could not find that element in the database.
       ```
     - If no argument is provided:
       ```
       Please provide an element as an argument.
       ```

2. **Input Validation:**
   - Handles errors for nonexistent or invalid arguments.
   - Allows searches by:
     - Atomic number (`./element.sh 1`).
     - Symbol (`./element.sh H`).
     - Name (`./element.sh Hydrogen`).

3. **Maintenance:**
   - The `element.sh` file has execution permissions (`chmod +x element.sh`).

---

### **Git and Version Control**

1. **Git Repository:**
   - A Git repository was created in the `periodic_table` folder using `git init`.

2. **Structured Commits:**
   - Clear and descriptive commit messages followed best practices, using prefixes like `fix:`, `feat:`, `refactor:`, `chore:`, and `test:`.
   - Example commits:
     - `Initial commit`
     - `fix: renamed weight to atomic_mass`
     - `feat: added table types and inserted data`
     - `refactor: capitalized symbols and adjusted atomic_mass`
     - `test: tested element.sh script`

3. **Branch Management:**
   - Changes were organized and merged systematically into the main branch.

---

### **Final Project State**

- All tables and data are complete and normalized.
- The Bash script fulfills all required functionalities and handles errors correctly.
- The commit history and repository structure adhere to Git best practices.
- No uncommitted changes exist, and the working tree is clean.

---
