# import csv,codecs
# from tgrocery import Grocery

# trainFileName='after_pre_porcess.txt'
# testFileName='/home/wangjianfei/git/data/test.txt'
# outputFileName='temp_result.txt'

# str=''
# trainlist=[]
# # train #################################
# filein=codecs.open(trainFileName,'r','utf-8')
# in_reader=filein.readlines()
# i=0
# for line in in_reader:
#     i=i+1
#     if(i%5000==0):
#         print ("%d "%(i))+'#'*30
#     str=line.split(u'\t')
#     count=str.__len__()
    
#     if(count<3):
#         continue
#     #print count
#     #print str
#     trainstr=(str[1],str[2])
#     trainlist.append(trainstr)
#     #print str[1]+u','+str[2]

# grocery=Grocery('sample')
# grocery.train(trainlist)
# filein.close()


# # test ##################################
# print 'start test'
# TP=0.0
# TN=0.0
# FP=0.0
# FN=0.0

# filetest=codecs.open(testFileName,'r','utf-8')
# test_reader=filetest.readlines()

# resultlist=[]
# for line in test_reader:
#     str=line.split(u'\t')
#     #import pdb; pdb.set_trace()
#     #print line
#     if(len(str)<2):
#         continue
#     # this code is different between cross_test and last commit
#     result=grocery.predict(str[1])
#     resultlist.append((str[0],result))
#     if(result.predicted_y==str[1]):       
#         if(result.predicted_y==u'0'):
#             TP=TP+1
#         else:
#             TN=TN+1
#     else:
#         if(result.predicted_y==u'0'):
#             FP=FP+1
#         else:
#             FN=FN+1
# # can't compute the next when running  raw test file 
# # filetest.close()
# # lprecision=TN/(TN+FN)
# # lrecall=TN/(FP+TN)

# # nprecision=TP/(TP+FP)
# # nrecall=TP/(TP+FN)


# # Fla=0.65*lprecision+0.35*lrecall
# # Fn=0.65*nprecision+0.35*nrecall

# # f=0.7*Fla+0.3*Fn
# # print 'TP',TP,'TN',TN,'FP',FP,'FN',FN
# # print f
 
# # write result to result.txt #######################
# fileout=codecs.open(outputFileName,'w','utf-8')
# csvout=csv.writer(fileout)
# csvout.writerows(resultlist)
# fileout.close()
a=[]
print "start"
for i in range(100000000):
    a.append(i)
    if  i%1000000==0 :
        print i
print "finish"

