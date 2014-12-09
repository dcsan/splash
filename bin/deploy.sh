DEPLOYURL="start.xgram.org"
cd app && meteor deploy $DEPLOYURL
# --settings private/config/prod.json 
# curl "http://redes.meteor.com/datapack/server/reload" &
open $DEPLOYURL
meteor logs $DEPLOYURL
