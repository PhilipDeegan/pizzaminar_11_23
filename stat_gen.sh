set -eu
SOURCE_DIR="$1"
# CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" && cd $CWD
[ -d "${SOURCE_DIR}" ] || echo "bad input directory"
cd ${SOURCE_DIR}

CXX_FILETYPES=(".h" ".hpp" ".cpp")
ALL_FILETYPES=(".h" ".hpp" ".cpp" ".py")

CXX_DIRS=("src" "tests" )
ALL_DIRS=("src" "tests" "pyphare")

CODE_STRINGS=("class " "struct ")

TEST_STRINGS=("TEST_" )

# for dir in ${ALL_DIRS[@]}; do
#     for ft in ${ALL_FILETYPES[@]}; do
#         echo $dir $ft $(find $dir -name "*${ft}" | sed 's/.*/"&"/' | xargs  wc -l | tail -1)
#     done
# done


# # preprocess to remove comments - needs git reset/checkout to revert
# for dir in ${CXX_DIRS[@]}; do
#     for ft in ${CXX_FILETYPES[@]}; do
#         for f in $(find $dir -name "*${ft}" ); do
#             cpp -dD -fpreprocessed -o $f.pp $f
#             mv $f.pp $f
#         done
#     done
# done


# for dir in ${CXX_DIRS[@]}; do
#     for ft in ${CXX_FILETYPES[@]}; do
#         for str in ${CODE_STRINGS[@]}; do
#             echo $dir $ft $str $(find $dir -name "*${ft}" | sed 's/.*/"&"/' | xargs grep "$str" | wc -l )
#         done
#     done
# done


for ft in ${CXX_FILETYPES[@]}; do
    for str in ${TEST_STRINGS[@]}; do
        echo tests $ft $str $(find tests -name "*${ft}" | sed 's/.*/"&"/' | xargs grep "$str" | wc -l )
    done
done

