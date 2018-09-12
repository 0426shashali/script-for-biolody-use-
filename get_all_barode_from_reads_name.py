import sys
inputfile=sys.argv[1]
outputfile=sys.argv[2]

readsname=open(inputfile,'r')
barcode=open(outputfile,'w')

for each in readsname:
    each1=each.strip().split(' ')
    barcodeseq=each1[1]
    barcode.write(barcodeseq+'\n')

readsname.close()
barcode.close()
