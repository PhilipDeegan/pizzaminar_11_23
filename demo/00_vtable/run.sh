
COUNT=$(find . -type f -name "poly*.cpp" | wc -l)
COUNT=$((COUNT-1))

for i in $(seq 0 $COUNT); do
    f="poly${i}.cpp"
    echo "$f"
    mkn build  -Og 0 -M $f 2>&1 > /dev/null  && mkn run
    echo ""
done
