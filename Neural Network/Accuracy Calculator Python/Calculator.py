f1=open("GeneratedAnswers.txt","r") 
f2=open("GivenAnswers.txt","r")
counter = 0; 
for line1 in f1: 
    for line2 in f2: 
        if line1==line2: 
            counter += 1 
        else: 
            pass
        break 
f1.close() 
f2.close()

print("Accuracy: " + str(counter * 100 / 750))
