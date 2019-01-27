*Edward Yu*


### Overall Grade: 100/110

### Quality of report: 10/10

-   Is the homework submitted (git tag time) before deadline?  

    Yes. `Jan 25, 2019, 9:25 PM PST`.

-   Is the final report in a human readable format html? 

    Yes. `html`.

-   Is the report prepared as a dynamic document (R markdown) for better reproducibility?

    Yes. `Rmd`.

-   Is the report clear (whole sentences, typos, grammar)? Do readers have a clear idea what's going on and how are results produced by just reading the report? 

	Yes. 
 

### Correctness and efficiency of solution: 55/60

-   Q1 (10/10)

-   Q2 (20/20)

	
-   Q3 (12/15)

	\#2. (-3 pts) `grep -c` does not account for multiple occurrences in one line. Use option `-ow`:

	```
	grep -ow $char pride_and_prejudice.txt  | wc -l 
	```
		
-  Q4 (13/15)

	\#3. (-2 pts) Table looks crude. 	Try using `kable` for printing table. Add the following lines to your `collection.R`
	
	```
	library(knitr)
    knitr::kable(Final_Table)
	```
   and add the `results="asis"` option to the code chunk in `hw1sol.Rmd`:

    ````
    ```{bash, results="asis"}
    Rscript collection.R
    ```
    ````
 
### Usage of Git: 10/10

-   Are branches (`master` and `develop`) correctly set up? Is the hw submission put into the `master` branch?

    Yes.

-   Are there enough commits? Are commit messages clear?  

    10 commits for hw1 in `develop` branch. 
              
-   Is the hw1 submission tagged? 

    Tag name should be `hw1`. 

-   Are the folders (`hw1`, `hw2`, ...) created correctly? 

    Yes.
  
-   Do not put a lot auxiliary files into version control. 

	 Yes. 

### Reproducibility: 8/10

-   Are the materials (files and instructions) submitted to the `master` branch sufficient for reproducing all the results? Just click the `knit` button will produce the final `html` on teaching server? (-2 pts)

	Clicking knit button does not produce the final html on teaching server. Make sure your collaborators can easily run your code. 	
	- `paste("/home/*/biostat-m280-2019-winter/hw1/n", n, "dist",
                   dist, ".txt", sep="")` does not run. You may use something like ``paste("/./n", n, "dist", dist, ".txt", sep="")``
                  
	- `eval=FALSE` in 
	
	````
	```{bash, eval=FALSE}
    curl https://www.gutenberg.org/files/1342/1342.txt > pride_and_prejudice.txt
    ```
	````
	prevents downloading the file `pride_and_prejudice.txt`. 

	
-   If necessary, are there clear instructions, either in report or in a separate file, how to reproduce the ressults?

    Yes.

### R code style: 17/20

-   [Rule 3.](https://google.github.io/styleguide/Rguide.xml#linelength) The maximum line length is 80 characters. 


-   [Rule 4.](https://google.github.io/styleguide/Rguide.xml#indentation) When indenting your code, use two spaces.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place spaces around all binary operators (=, +, -, &lt;-, etc.).  (-1 pt)

	Some violations:
	- `runSim.R`: line 41, 42
	
	
-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place a space before a comma, but always place one after a comma. (-2 pts) 

	Some violations:
	- `runSim.R`: line 38, 41, 42
	- `collection.R`: line 15

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Place a space before left parenthesis, except in a function call.

-   [Rule 5.](https://google.github.io/styleguide/Rguide.xml#spacing) Do not place spaces around code in parentheses or square brackets.
