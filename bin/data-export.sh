# set -x

KEY=10Kwg8Flo-5lmeAcBHme6K7EUrgSWwQNn_FgKLMl3niU

MULTI1="1362520581"
MULTI2="232694477"
SHEET_GRAM='1066923483'
SHEET_EXAMPLES='232694477'

# GTAB=${SHEET_GRAM}
GTAB=${SHEET_EXAMPLES}

URL="https://docs.google.com/spreadsheets/d/${KEY}/export?gid=${GTAB}&format=csv&id=${KEY}"

echo $URL

# curl $URL > app/packages/datapack/data/grammar.csv
curl $URL > app/packages/datapack/data/Examples.csv

