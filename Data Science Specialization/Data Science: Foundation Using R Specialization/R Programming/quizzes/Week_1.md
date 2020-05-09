Question 1
----------
R was developed by statisticians working at...

### Answer
The University of Auckland

Question 2
----------
The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition?

### Answer
-The freedom to sell the software for any price.
-The freedom to restrict access to the source code of the software.
-The freedom to prevent users from using the software for undesirable purposes.

Question 3
----------
In R the following are all atomic data types EXCEPT

### Answer
-list
-array
-data.frame
-table
-matrix

Question 4
----------
If I execute the expression x <- 4L in R, what is the class of the object 'x' as determined by the `class()' function?

### Answer
- integer

Question 5
----------
What is the class of the object defined by x <- c(4, TRUE)?

### Answer
- numeric

Question 6
----------
If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression cbind(x, y)?

### Answer
- a matrix with 2 columns and 3 rows.	

Question 7
----------
A key property of vectors in R is that

### Answer
- elements of a vector all must be of the same class

Question 8
----------
Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[2]] give me?

### Answer
-a character vector containing the letter "a".
-a character vector of length 1.

Question 9
----------
Suppose I have a vector x <- 1:4 and a vector y <- 2:3. What is produced by the expression x + y?

### Answer
an integer vector with elements 3, 5, 5, 7.

Question 10
-----------
Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) and I want to set all elements of this vector that are greater than 10 to be equal to 4. What R code achieves this?

### Answer

- x[x >= 11] <- 4
- x[x > 10] <- 4

Question 11
-----------
In the dataset provided for this Quiz, what are the column names of the dataset?

### Answer
Ozone, Solar.R, Wind, Temp, Month, Day

```R
> data<-read.csv("hw1_data.csv")
> colnames(data)
[1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"  
```

Question 12
-----------
Extract the first 2 rows of the data frame and print them to the console. What does the output look like?

### Answer
	  Ozone Solar.R Wind Temp Month Day
	1    41     190  7.4   67     5   1
	2    36     118  8.0   72     5   2

```R
> head(data,2)
```

Question 13
-----------
How many observations (i.e. rows) are in this data frame?

### Answer
153

```R
> nrow(data)
[1] 153
```

Question 14
-----------
Extract the last 2 rows of the data frame and print them to the console. What does the output look like?

### Answer

	   Ozone Solar.R Wind Temp Month Day
	152    18     131  8.0   76     9  29
	153    20     223 11.5   68     9  30

```R
> tail(data, 2)
```

Question 15
-----------
What is the value of Ozone in the 47th row?

### Answer
21

```R
> data$Ozone[47]
[1] 21
```

Question 16
-----------
How many missing values are in the Ozone column of this data frame?

### Answer
37

```R
> k<-is.na(data$Ozone)
> sum(k)
[1] 37
```


Question 17
-----------
What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.

### Answer
42.1

### Explanation
The 'mean' function can be used to calculate the mean.

```R
> mean(data$Ozone[!is.na(data$Ozone)])
[1] 42.12931 
```

Question 18
-----------
Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?

### Answer
212.8

```R
> z<-data$Solar.R[data$Ozone>31 & data$Temp>90]
> mean(z[!is.na(z)])
[1] 212.8
```

Question 19
-----------
What is the mean of "Temp" when "Month" is equal to 6?

### Answer
79.1

### Explanation

```R
> mean(data$Temp[data$Month==6])
[1] 79.1
```

Question 20
-----------
What was the maximum ozone value in the month of May (i.e. Month = 5)?

### Answer
115

### Explantion

```R
> z<-data$Ozone[data$Month==5]
> max(z[!is.na(z)])
[1] 115
```
