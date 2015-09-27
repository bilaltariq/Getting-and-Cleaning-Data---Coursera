## Variables
subject                    1..2
    Subject number
                           1..30 .Unique identifier assigned to each subject

label                      6..18
    Acitivity label
                           "WALKING"
                           "WALKING_UPSTAIRS"
                           "WALKING_DOWNSTAIRS"
                           "SITTING"
                           "STANDING"
                           "LAYING"

## Data
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).

The magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

These signals were used to estimate variables of the feature vector for each pattern:'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

For instance: tbodyacc-xyz,tgravityacc-xyz,tbodyaccjerk-xyz,tbodygyro-xyz etc.

The set of variables that were estimated from these signals are: 
mean: Mean value; std: Standard deviation

## Transformation
All the values are means, aggregated over 30 subjects and 6 activities, hence the resulting dataset is 180 rows by 68 columns.