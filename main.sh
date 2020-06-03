source activate py27_yl

#### Prepare #################################

## get list of samples
cd raw_data
ls *fastq.gz | sed "s|.fastq.gz||g" > samples
cd ..

## enumerate all combinations of guides
R --no-save < log/get_combinations.R

## build bowtie2 index with all combinations
#cd raw_data/
#bowtie2-build combinations.fa combinations
#cd ..

## build blast index with all combinations
cd raw_data/
makeblastdb -in combinations.fa -parse_seqids -dbtype nucl -out combinations
cd ..

#### TRIM ###################################

mkdir trim
for i in `cat raw_data/samples`;do
sed "s|example|$i|g" log/example.trim.batch > log/$i.trim.batch
bsub < log/$i.trim.batch
done

#### Align ###################################

#mkdir alignment
#for i in `cat raw_data/samples`;do
#sed "s|example|$i|g" log/example.align.batch > log/$i.align.batch
#bsub < log/$i.align.batch
#done

#### Blast ###################################

mkdir blast
for i in `cat raw_data/samples`;do
sed "s|example|$i|g" log/example.blast.batch > log/$i.blast.batch
bsub < log/$i.blast.batch
done

cd blast
R --no-save < ../log/blast.summary.R
cd ..
