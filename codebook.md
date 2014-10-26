#Codebook

- subject: integer variable identifying the subject who performed the activity for each sample. Its range is from 1 to 30.
- activity: factor variable with levels "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING" and "LAYING". 
It describes activity which was performed by subject. 

Other variables are numeric and contain means of initial variables for each activity and each subject. Their names are pretty descriptive
and understandable but you can use their history to clarify their meanings:

The variables (before calculating average values) for this database come from the accelerometer and gyroscope (so you have "Accelerometer" 
and "Gyroscope" in their names) 3-axial raw signals ("AlongX" says "signal along x axis" and etc.). These time domain signals 
(prefix 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order 
low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then 
separated into body and gravity acceleration signals (there are "Body" and "Gravity" in names to distinct them). 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals ("Jerk" in names). Also the magnitude 
of these three-dimensional signals were calculated using the Euclidean norm ("Magnitude" for magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing their frequencies. (Note the "frequency" to indicate 
frequency domain signals). 

Initial data set consisted of many measurements but we used only those that were connected with mean and standard deviation. You can distinct them 
words "Mean" and "StandardDeviation" in their names.

There is full list of variables (except "subject" and "activity" considered at the beginning):

* "timeBodyAccelerometerMeanAlongX"                         
* "timeBodyAccelerometerMeanAlongY"                         
* "timeBodyAccelerometerMeanAlongZ"                         
* "timeBodyAccelerometerStandardDeviationAlongX"            
* "timeBodyAccelerometerStandardDeviationAlongY"            
* "timeBodyAccelerometerStandardDeviationAlongZ"            
* "timeGravityAccelerometerMeanAlongX"                      
* "timeGravityAccelerometerMeanAlongY"                      
* "timeGravityAccelerometerMeanAlongZ"                      
* "timeGravityAccelerometerStandardDeviationAlongX"         
* "timeGravityAccelerometerStandardDeviationAlongY"         
* "timeGravityAccelerometerStandardDeviationAlongZ"         
* "timeBodyAccelerometerJerkMeanAlongX"                     
* "timeBodyAccelerometerJerkMeanAlongY"                     
* "timeBodyAccelerometerJerkMeanAlongZ"                     
* "timeBodyAccelerometerJerkStandardDeviationAlongX"        
* "timeBodyAccelerometerJerkStandardDeviationAlongY"        
* "timeBodyAccelerometerJerkStandardDeviationAlongZ"        
* "timeBodyGyroscopeMeanAlongX"                             
* "timeBodyGyroscopeMeanAlongY"                             
* "timeBodyGyroscopeMeanAlongZ"                             
* "timeBodyGyroscopeStandardDeviationAlongX"                
* "timeBodyGyroscopeStandardDeviationAlongY"                
* "timeBodyGyroscopeStandardDeviationAlongZ"                
* "timeBodyGyroscopeJerkMeanAlongX"                         
* "timeBodyGyroscopeJerkMeanAlongY"                         
* "timeBodyGyroscopeJerkMeanAlongZ"                         
* "timeBodyGyroscopeJerkStandardDeviationAlongX"            
* "timeBodyGyroscopeJerkStandardDeviationAlongY"            
* "timeBodyGyroscopeJerkStandardDeviationAlongZ"            
* "timeBodyAccelerometerMagnitudeMean"                      
* "timeBodyAccelerometerMagnitudeStandardDeviation"         
* "timeGravityAccelerometerMagnitudeMean"                   
* "timeGravityAccelerometerMagnitudeStandardDeviation"      
* "timeBodyAccelerometerJerkMagnitudeMean"                  
* "timeBodyAccelerometerJerkMagnitudeStandardDeviation"     
* "timeBodyGyroscopeMagnitudeMean"                          
* "timeBodyGyroscopeMagnitudeStandardDeviation"             
* "timeBodyGyroscopeJerkMagnitudeMean"                      
* "timeBodyGyroscopeJerkMagnitudeStandardDeviation"         
* "frequencyBodyAccelerometerMeanAlongX"                    
* "frequencyBodyAccelerometerMeanAlongY"                    
* "frequencyBodyAccelerometerMeanAlongZ"                    
* "frequencyBodyAccelerometerStandardDeviationAlongX"       
* "frequencyBodyAccelerometerStandardDeviationAlongY"       
* "frequencyBodyAccelerometerStandardDeviationAlongZ"       
* "frequencyBodyAccelerometerJerkMeanAlongX"                
* "frequencyBodyAccelerometerJerkMeanAlongY"                
* "frequencyBodyAccelerometerJerkMeanAlongZ"                
* "frequencyBodyAccelerometerJerkStandardDeviationAlongX"   
* "frequencyBodyAccelerometerJerkStandardDeviationAlongY"   
* "frequencyBodyAccelerometerJerkStandardDeviationAlongZ"   
* "frequencyBodyGyroscopeMeanAlongX"                        
* "frequencyBodyGyroscopeMeanAlongY"                        
* "frequencyBodyGyroscopeMeanAlongZ"                        
* "frequencyBodyGyroscopeStandardDeviationAlongX"           
* "frequencyBodyGyroscopeStandardDeviationAlongY"           
* "frequencyBodyGyroscopeStandardDeviationAlongZ"           
* "frequencyBodyAccelerometerMagnitudeMean"                 
* "frequencyBodyAccelerometerMagnitudeStandardDeviation"    
* "frequencyBodyAccelerometerJerkMagnitudeMean"             
* "frequencyBodyAccelerometerJerkMagnitudeStandardDeviation"
* "frequencyBodyGyroscopeMagnitudeMean"                     
* "frequencyBodyGyroscopeMagnitudeStandardDeviation"        
* "frequencyBodyGyroscopeJerkMagnitudeMean"                 
* "frequencyBodyGyroscopeJerkMagnitudeStandardDeviation" 