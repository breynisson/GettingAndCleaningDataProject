Codebook
=============================

### Steps for reproducing the tidy dataset.
1. Reading in the following files:
   - X_test.txt
   - X_train.txt
   - y_test.txt
   - y_train.txt
   - subject_test.txt
   - subject_train.txt
   - features.txt 
2.  Merge X_test and X_train with rbind.
3.  Merge y_test and y_train with rbind.
4.  Make a column with y data mapped to activty levels.
5.  Merge subject_test and subject_train with rbind.
6.  Read column names from features.txt files.
7.  Set column names to lowercase.
8.  Remove parenthesis from column names.
9.  Change "t" at start of column name to "Timedomain-".
10. Change "f" at start of column name to "Freqdomain-"
11. Set the column names of the merged X data.
12. Add the subject column to the dataset.
13. Add the activty desription to the dataset.
14. Find indexes of colums containing means and std. 
15. Subset those colums into a new dataframe.
16. Create a datafram with the means, std, activity and subject.
17. Loop through all 30 subject and:
    - Create temp variable for subsetting per subject.
    - Subset by activity.
    - Find the column means of the resulting subset.
    - Append the results to a new dataframe.
    - Clean up all temp variables.
18. Set activity and subject columns for new data frame.
19. Set the column names of tidy dataset.
20. Save tidy dataset to .txt file.


### Variables of the tidy dataset:
1.  subject
2.  activity
3.	Timedomain-bodyacc-mean-x
4.	Timedomain-bodyacc-mean-y
5.	Timedomain-bodyacc-mean-z
6.	Timedomain-gravityacc-mean-x
7.	Timedomain-gravityacc-mean-y
8.	Timedomain-gravityacc-mean-z
9.	Timedomain-bodyaccjerk-mean-x
10.	Timedomain-bodyaccjerk-mean-y
11.	Timedomain-bodyaccjerk-mean-z
12.	Timedomain-bodygyro-mean-x
13.	Timedomain-bodygyro-mean-y
14.	Timedomain-bodygyro-mean-z
15.	Timedomain-bodygyrojerk-mean-x
16.	Timedomain-bodygyrojerk-mean-y
17.	Timedomain-bodygyrojerk-mean-z
18.	Timedomain-bodyaccmag-mean
19.	Timedomain-gravityaccmag-mean
20.	Timedomain-bodyaccjerkmag-mean
21.	Timedomain-bodygyromag-mean
22.	Timedomain-bodygyrojerkmag-mean
23.	Freqdomain-bodyacc-mean-x
24.	Freqdomain-bodyacc-mean-y
25.	Freqdomain-bodyacc-mean-z
26.	Freqdomain-bodyacc-meanfreq-x
27.	Freqdomain-bodyacc-meanfreq-y
28.	Freqdomain-bodyacc-meanfreq-z
29.	Freqdomain-bodyaccjerk-mean-x
30.	Freqdomain-bodyaccjerk-mean-y
31.	Freqdomain-bodyaccjerk-mean-z
32.	Freqdomain-bodyaccjerk-meanfreq-x
33.	Freqdomain-bodyaccjerk-meanfreq-y
34.	Freqdomain-bodyaccjerk-meanfreq-z
35.	Freqdomain-bodygyro-mean-x
36.	Freqdomain-bodygyro-mean-y
37.	Freqdomain-bodygyro-mean-z
38.	Freqdomain-bodygyro-meanfreq-x
39.	Freqdomain-bodygyro-meanfreq-y
40.	Freqdomain-bodygyro-meanfreq-z
41.	Freqdomain-bodyaccmag-mean
42.	Freqdomain-bodyaccmag-meanfreq
43.	Freqdomain-bodybodyaccjerkmag-mean
44.	Freqdomain-bodybodyaccjerkmag-meanfreq
45.	Freqdomain-bodybodygyromag-mean
46.	Freqdomain-bodybodygyromag-meanfreq
47.	Freqdomain-bodybodygyrojerkmag-mean
48.	Freqdomain-bodybodygyrojerkmag-meanfreq
49.	Timedomain-bodyacc-std-x
50.	Timedomain-bodyacc-std-y
51.	Timedomain-bodyacc-std-z
52.	Timedomain-gravityacc-std-x
53.	Timedomain-gravityacc-std-y
54.	Timedomain-gravityacc-std-z
55.	Timedomain-bodyaccjerk-std-x
56.	Timedomain-bodyaccjerk-std-y
57.	Timedomain-bodyaccjerk-std-z
58.	Timedomain-bodygyro-std-x
59.	Timedomain-bodygyro-std-y
60.	Timedomain-bodygyro-std-z
61.	Timedomain-bodygyrojerk-std-x
62.	Timedomain-bodygyrojerk-std-y
63.	Timedomain-bodygyrojerk-std-z
64.	Timedomain-bodyaccmag-std
65.	Timedomain-gravityaccmag-std
66.	Timedomain-bodyaccjerkmag-std
67.	Timedomain-bodygyromag-std
68.	Timedomain-bodygyrojerkmag-std
69.	Freqdomain-bodyacc-std-x
70.	Freqdomain-bodyacc-std-y
71.	Freqdomain-bodyacc-std-z
72.	Freqdomain-bodyaccjerk-std-x
73.	Freqdomain-bodyaccjerk-std-y
74.	Freqdomain-bodyaccjerk-std-z
75.	Freqdomain-bodygyro-std-x
76.	Freqdomain-bodygyro-std-y
77.	Freqdomain-bodygyro-std-z
78.	Freqdomain-bodyaccmag-std
79.	Freqdomain-bodybodyaccjerkmag-std
80.	Freqdomain-bodybodygyromag-std
81.	Freqdomain-bodybodygyrojerkmag-std