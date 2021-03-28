#!/bin/bash
DEFAULT='bilin'
INTERPOLATION=${1:-$DEFAULT}

med_dir='validation/med_res'
med_names=('abc_0050_00500348_fae0ecd8b3dc068d39f0d09c_000' \
'abc_0050_00500149_54930d6f7740b03347d89a56_000' \
'abc_0050_00500166_5894bbd701b2bb0fc88a6978_007' \
'abc_0050_00500082_4cb4bf14428fe3832dd7ed78_000' \
'abc_0050_00500683_511f7debb63f164003339dec_000')

for filename in ${med_names[*]}; do
    python gcv_v2021.1_hw1/scripts/fuse_images.py \
        --true-filename ${med_dir}/${filename}.hdf5 \
        --pred-filename ${med_dir}/${filename}__predictions.hdf5 \
        --output-dir out/med/${INTERPOLATION} \
        -r 0.05 \
        #	-i ${INTERPOLATION} \

done

high_dir='validation/high_res'
high_names=('abc_0050_00500348_fae0ecd8b3dc068d39f0d09c_000' \
'abc_0050_00500166_5894bbd701b2bb0fc88a6978_007')

for filename in ${high_names[*]}; do
    python gcv_v2021.1_hw1/scripts/fuse_images.py \
        --true-filename ${high_dir}/${filename}.hdf5 \
        --pred-filename ${high_dir}/${filename}__predictions.hdf5 \
        --output-dir out/high/${INTERPOLATION} \
        -r 0.02
        # -i ${INTERPOLATION} \

done
