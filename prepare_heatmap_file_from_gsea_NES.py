#this script can gernerate a matrix by columnnames and rownames

outfile=open('/Users/lishasha/Desktop/home/new_work/20150904_7000compound/capital_bio/probe_test/gsea_pathway/result_0.05.fa','w')
pathwaylist=open( '/Users/lishasha/Desktop/home/new_work/20150904_7000compound/capital_bio/probe_test/gsea_pathway/pathway.fa','r')
infile=open('/Users/lishasha/Desktop/home/new_work/20150904_7000compound/capital_bio/probe_test/gsea_pathway/infile.fa','r')

# input all sample names
lst=[]
samplelist=open('/Users/lishasha/Desktop/home/new_work/20150904_7000compound/capital_bio/probe_test/gsea_pathway/sample.fa','r')
for each in samplelist:
    each1=each.strip('\n').split('\t')
    lst.append(each1)
length=len(lst)

#get a matrix with pathway and samples with 0 filled
d={}
for g in pathwaylist:
    g=g.strip('\n')
    d[g]=[0]*length

#replace the specific 0 with specific NES 
for l in infile:
    f=l.strip('\n').split('\t')
    f1=f[0].split('_')
    g1=f1[1]
    column=f1[0]
    if g1 in d:
        d[g1][lst.index([column])]=f[1]

#write the dic out       
for k in d:
    outfile.write(k+'\t'+str(d[k])+'\n')
outfile.close()
