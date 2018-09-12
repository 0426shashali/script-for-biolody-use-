import os,glob
input = glob.glob( '/data/150728_C00126_0206_AC5409ACXX/unligned_by_barcode8/Project_C5409ACXX/*' )
for d in input:
    name = d.split('/')[-1]
    print('gzip -d {f}/*.gz | cat {f}/*.fastq >> /data/150728_C00126_0206_AC5409ACXX/Unaligned/Undetermined_indices/lane7_plate1_fastq/{b}.fastq'.format( f = d,b = name ))
    os.system('gzip -d {f}/*.gz | cat {f}/*.fastq >> /data/150728_C00126_0206_AC5409ACXX/Unaligned/Undetermined_indices/lane7_plate1_fastq/{b}.fastq'.format( f = d,b = name ))
    print name + ' finished'

