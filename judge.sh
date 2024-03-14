#!/bin/bash
input_dir="input"
result_dir="result"
answer_dir="answer"
compiler="./build/out/scanner"

RED="\033[0;31m"
GREEN="\033[0;32m"
RESET="\033[0m"

show_diff=false
specific_test=""
specific_subtest=""
specific_testcase=""
specific_test_find=false
score=0

usage() {
    echo "Usage: $0 [-d|--diff] [--case=subtask/testcase] [-h|--help]"
    echo "Options:"
    echo "  -d, --diff        Show difference between actual and expected output"
    echo "  --case=subtask/testcase"
    echo "                    Run a specific testcase"
    echo "  -h, --help        Display this usage information"
}

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -d|--diff)
            show_diff=true
            shift
        ;;
        --case=*)
            specific_test="${key#*=}"
            specific_subtest=$(dirname $specific_test)
            specific_testcase=$(basename $specific_test)
            if [ $specific_subtest = "." ]; then
                specific_subtest=$specific_testcase
                specific_testcase=""
            fi
            shift
        ;;
        -h|--help)
            usage
            exit 0
        ;;
        *)
            echo "Unknown option: $key"
            exit 1
        ;;
    esac
done

make build

get_score() {
    local subtask="$1"
    case "$subtask" in 
        subtask01-helloworld) return 8 ;;
        subtask02-comment) return 8 ;;
        subtask03-precedenc) return 8 ;;
        subtask04-assigment) return 8 ;;
        subtask05-casting) return 8 ;;
        subtask06-if) return 8 ;;
        subtask07-while) return 8 ;;
        subtask08-for) return 8 ;;
        subtask09-function) return 8 ;;
        subtask10-array) return 8 ;;
        subtask11-autotype) return 8 ;;
        subtask12-loop2) return 10 ;;
        subtask13-2Darray) return 8 ;;
        subtask14-forall) return 14 ;;
    esac
}

run_test() {
    local subtask="$1"
    local testcase="$2"
    local output_file="$result_dir/$subtask/$testcase.out"

    # Compile the testcase
    $compiler "$input_dir/$subtask/$testcase.cpp" > "$output_file"

    if [ $? -eq 0 ]; then
        # Check if expected output file exists
        if [ -f "$output_file" ]; then
            # Compare the output with expected output
            diff_output=$(git diff --no-prefix --no-index --ignore-cr-at-eol --color "$answer_dir/$subtask/$testcase.out" "$output_file")
            if [ -z "$diff_output" ]; then
                echo -e "✅$GREEN $testcase output matches expected$RESET"
                return 1
            else
                echo -e "❌$RED '$subtask/$testcase' output does not match expected$RESET"
                if [ "$show_diff" = true ]; then
                    echo "$diff_output"
                fi
            fi
        else
            echo -e "❌$RED $subtask/$testcase No expected output file found$RESET"
        fi
    else
        echo -e "❌$RED $subtask/$testcase exit with code $?$RESET"
    fi
}

# Iterate through each test group
for sub_dir in "$input_dir"/*; do
    # Extract subtask name
    subtask=$(basename "$sub_dir")
    mkdir -p "$result_dir/$subtask"

    # Check if specific subtest
    if [ -n "$specific_test" ] && [ "$subtask" != "$specific_subtest" ]; then
        continue
    fi

    echo "########## $subtask ##########"
    pass_subtask=true
    # Iterate through each testcase
    for testcase_file in "$sub_dir"/*.cpp; do
        # Extract testcase filename without extension
        testcase=$(basename -s .cpp "$testcase_file")
        # Check if specific testcase
        if [ -n "$specific_testcase" ] && [ "$testcase" != "$specific_testcase" ]; then
            continue
        fi
        specific_test_find=true
        run_test "$subtask" "$testcase"
        # Check if test pass
        if [ $? != 1 ]; then
            pass_subtask=false
        fi
    done
    if [ $pass_subtask = true ]; then
        get_score "$subtask"
        score=$((score+$?))
    fi
done

if [ -n "$specific_test" ] && [ $specific_test_find = false ]; then
    echo "Testcase: '$specific_subtest/$specific_testcase' not found"
    echo "Available: "
    for sub_dir in "$input_dir"/*; do
        subtask=$(basename "$sub_dir")
        for testcase_file in "$sub_dir"/*.cpp; do
            testcase=$(basename -s .cpp "$testcase_file")
            echo "$subtask/$testcase"
        done
    done
else
    echo "Score: $score"
fi