@echo off
path "C:\Documents and Settings\Hester_lab\Desktop\svm_light\svm_light_windows\"
svm_learn.exe -t 2 -g %1 "C:\Documents and Settings\Hester_lab\Desktop\Integrated_Calibration\SVM_train.txt" model.txt
svm_classify "C:\Documents and Settings\Hester_lab\Desktop\Integrated_Calibration\SVM_full.txt" model.txt prediction.txt
