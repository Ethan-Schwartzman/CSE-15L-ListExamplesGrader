# Classpath
CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

# Clean up any leftover folders from last run
if test -d student-submission; then
    rm -rf student-submission
fi
if test -d grading-area; then
    rm -rf grading-area
fi

# Make a grading area directory
mkdir grading-area

# Clone the repository into the student-submission directory
git clone $1 student-submission
echo 'Finished cloning'

# Find file path information
file=`find -name "ListExamples.java"`
testExamples=./TestListExamples.java

# If the file was found...
if [[ -f $file ]]

then echo "ListExamples.java successfully found"

# Compile and run the java files
cp -r $file $testExamples ./grading-area
javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" ./grading-area/*.java
java -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar;grading-area" org.junit.runner.JUnitCore TestListExamples > grading-area/test-results.txt

# Get the results
results=`grep "Tests run" grading-area/test-results.txt`

# Format the numbers
passescomma=$(echo "$results" | awk '{print $3}')
passes=`echo $passescomma | awk '{ print substr( $0, 0, 1 ) }'`
fails=$(echo "$results" | awk '{print $5}')

# Show the number of passes and fails
echo
echo $passes "Pass(es)"
echo $fails "Fail(s)"

# Calculate the and show total score
total=`expr $passes + $fails`
echo $total Total

# Calculate and show the final score
score100=`expr $passes '*' 100`
scoreFinal=`expr $score100 '/' $total` 
echo
echo Score is: $scoreFinal "%"

else echo "ListExamples.java could not be found"
fi