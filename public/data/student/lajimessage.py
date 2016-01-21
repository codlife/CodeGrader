# coding=utf-8
from tgrocery import Grocery

grocery=Grocery('sample')

train_src = [
    ('education', '名师指导托福语法技巧：名词的复数形式'),
    ('education', '中国高考成绩海外认可 是“狼来了”吗？'),
    ('sports', '图文：法网孟菲尔斯苦战进16强 孟菲尔斯怒吼'),
    ('sports', '四川丹棱举行全国长距登山挑战赛 近万人参与')
  ]
grocery.train(train_src)
#grocery.train('/home/wangjianfei/git/data/train_ch.txt')
# grocery.train('train_ch.txt')
grocery.save()
new_grocery=Grocery('sample')
new_grocery.load()
print(new_grocery.predict('Abbott government spends $8 million on higher education media blitz'))
test_src = [
   ('education', '福建春季公务员考试报名18日截止 2月6日考试'),
    ('sports', '意甲首轮补赛交战记录:米兰客场8战不败国米10年连胜'),
]
print("start test..................")
#grocery.test('/home/wangjianfei/git/data/test.txt')
# grocery.train('train_ch.txt'))
# custom_grocery = Grocery('custom', custom_tokenize=list)
print(new_grocery.test(test_src))
