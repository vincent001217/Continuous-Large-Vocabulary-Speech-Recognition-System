dir=exp/lm

train_text=ASTMIC_transcription/train.text
lexicon=material/lexicon.train.txt
lm_output=$dir/lm.arpa.txt

#srilm_bin=/share/tool
#srilm_bin=/share/srilm/bin/i686-m64
srilm_bin=/share/srilm/bin/i686

mkdir -p $dir

# TODO:
#	1. process training text file
#	2. train a language model named $lm_output
cut -d ' ' -f 2- $train_text > exp/lm/LM_train.text

$srilm_bin/ngram-count -order 3 -kndiscount -text exp/lm/LM_train.text -vocab $lexicon -unk -lm $lm_output 

