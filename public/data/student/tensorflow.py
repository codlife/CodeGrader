import tensorflow as tf
sess=tf.Session()
a=tf.constant([1,2],shape=[1,2],name='a')
b=tf.constant([1,2],shape=[2,1],name='b')
c=tf.matmul(a,b)
sess=tf.Session(config=tf.ConfigProto(log_device_placement=True))
print sess.run(c)