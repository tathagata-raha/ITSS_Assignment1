#!/bin/bash
cat file1.csv > target_file.csv
cat file2.csv >> target_file.csv
touch header.csv
echo "Age,workclass,fnlwgt,education,education-num,marital-status,occupation,relationship,race,sex,capital-gain,capital-loss,native-country,class" >> header.csv
cat header.csv >> temp
cat target_file.csv >> temp
mv temp target_file.csv
rm header.csv
sed -i -e 's/?/2018114017/g' target_file.csv