# this file filt the words from files in direc "dict" in length
# used for MadHack 2019
# Author: Yuren Sun
# Last modified: Oct 19, 2019
import os

# read file
words = []
path_read = "dict"
files = os.listdir(path_read)
for file in files:
    if file[0] != ".":
        print(file)
        txtfile = open("dict/" + file,"r")
        for row in txtfile.read().split():
            words.append(row.split(" ")[0])

# threshold of length
# words with lengh above 8 are set to evil
easylen = 3
normallen = 6
hardlen = 8

# start filting
# arrays to store words
easyWords = []
normalWords = []
hardWords = []
evilWords = []

for word in words:
    if word.encode('utf-8').isalpha() and word.islower():
        if (len(word) <= easylen):
            if not (word in easyWords):
                easyWords.append(word)
        elif (len(word) <= normallen):
            if not (word in normalWords):
                normalWords.append(word)
        elif (len(word) <= hardlen):
            if not (word in hardWords):
                hardWords.append(word)
        else:
            if not (word in evilWords):
                evilWords.append(word)



# output words to txt files
easyname = "easy.txt"
normalname = "normal.txt"
hardname = "hard.txt"
evilname = "evil.txt"

file = open(easyname, "w")
list = "\n".join(easyWords)
file.write(list)
file.close()

file = open(normalname, "w")
list = "\n".join(normalWords)
file.write(list)
file.close()

file = open(hardname, "w")
list = "\n".join(hardWords)
file.write(list)
file.close()

file = open(evilname, "w")
list = "\n".join(evilWords)
file.write(list)
file.close()


