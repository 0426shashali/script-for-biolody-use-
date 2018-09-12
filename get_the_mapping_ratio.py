f=open('COMPAND_result.txt','r')
g=open('COMPAND_result_extract.fa','w')

for each in f:
    if each[0]=='b':
        a=each.split(' ')
        b=a[-1].split('/')[-1].split('.')[0]
        g.write(b+'\n')
    elif each[0]=='#':
        c=each.split(': ')[-1]
        g.write(c)

f.close()
g.close()
