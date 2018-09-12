import os
for i in range(2705):
    print('cut -f {field} total2.txt > ./split/{name}.txt'.format(field=i+1,name=str(i+1)))
    os.system('cut -f {field} total2.txt > ./split/{name}.txt'.format(field=i+1,name=str(i+1)))
    print 'finished'
