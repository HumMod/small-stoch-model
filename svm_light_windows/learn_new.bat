@echo off
path "C:\Documents and Settings\Hester_lab\Desktop\svm_light\svm_light_windows\"
svm_learn.exe -t 2 -g %1 -d 0 "C:\Documents and Settings\Hester_lab\My Documents\SVM_train.txt" model.txt
svm_classify "C:\Documents and Settings\Hester_lab\My Documents\SVM_full.txt" model.txt prediction.txt
