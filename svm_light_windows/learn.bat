path "C:\Documents and Settings\Hester_lab\Desktop\svm_light\svm_light_windows\"
svm_learn.exe -v 1 -t 2 -g 1.5 "C:\Documents and Settings\Hester_lab\My Documents\SVM_train.txt" "C:\Documents and Settings\Hester_lab\Desktop\svm_light\svm_light_windows\model.txt"
svm_classify "C:\Documents and Settings\Hester_lab\My Documents\SVM_full.txt" model.txt "C:\Documents and Settings\Hester_lab\Desktop\svm_light\svm_light_windows\prediction.txt"
