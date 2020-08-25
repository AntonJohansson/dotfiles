syntax match inttypes /\(c\|f\|i\|u\)\(8\|16\|32\|64\|128\)/
hi def link inttypes Type

syntax match mattypes /\(mat_\)\(size_t\|scalar_t\)/
hi def link mattypes Type
